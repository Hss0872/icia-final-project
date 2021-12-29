package com.best.team.gameRecode.service;


import com.best.team.gameRecode.bean.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.io.BufferedReader;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;

import java.net.URL;
import java.util.*;

@Slf4j
@Service
public class SummonerInfoMM {



    ModelAndView mav;


    public SummonerInfo getSummonerInfo(String champ_name) throws Exception {
        SummonerInfo si=new SummonerInfo();
        //라이엇 api 키
        String riot_api_key="RGAPI-e2c3b20e-ae8c-462e-868a-8e7185c9b12f";
        //소환사 puuid,level,id 가져오기
        String url1="https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+champ_name+"?api_key="+riot_api_key;
        URL get_url1= new URL(url1);
        System.out.println("url1 = " + url1);
        HttpURLConnection conn1= (HttpURLConnection) get_url1.openConnection();
        conn1.setRequestMethod("GET");
        conn1.setRequestProperty("Content-type","application/json");
        System.out.println("response code : "+conn1.getResponseCode());
        BufferedReader rd1;
        if(conn1.getResponseCode() >= 200 && conn1.getResponseCode() <= 300) {
            rd1 = new BufferedReader(new InputStreamReader(conn1.getInputStream()));
        } else {
            rd1 = new BufferedReader(new InputStreamReader(conn1.getErrorStream()));
        }
        // 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
        StringBuilder sb1 = new StringBuilder();
        String line1;
        while ((line1 = rd1.readLine()) != null) {
            sb1.append(line1);
        }
        // 10. 객체 해제.
        rd1.close();
        conn1.disconnect();
        JSONParser parser1 = new JSONParser();
        // 2. 문자열을 JSON 형태로 JSONObject 객체에 저장.
        JSONObject obj1 = (JSONObject)parser1.parse(sb1.toString());

        //summonerinfo 에 데이터 저장
        System.out.println(obj1);




        si.setPuuid(obj1.get("puuid").toString());
        si.setId(obj1.get("id").toString());
        si.setLevel(obj1.get("summonerLevel").toString());
        si.setSummonerName(obj1.get("name").toString());


        //해당 소환사의 티어 랭크 데이터 가져오기
        String url2;
        url2 = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+si.getId()+"?api_key="+riot_api_key;

        URL get_url2= new URL(url2);

        HttpURLConnection conn2= (HttpURLConnection) get_url2.openConnection();
        conn2.setRequestMethod("GET");
        conn2.setRequestProperty("Content-type","application/json");
        System.out.println("response code : "+conn2.getResponseCode());
        BufferedReader rd2;
        if(conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
            rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
        } else {
            rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
        }
        // 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
        StringBuilder sb2 = new StringBuilder();
        String line2;
        while ((line2 = rd2.readLine()) != null) {
            sb2.append(line2);
        }
        // 10. 객체 해제.
        rd2.close();
        conn2.disconnect();
        // 11. 전달받은 데이터 확인.
        String string = sb2.toString();

        ObjectMapper om = new ObjectMapper();
        JSONArray lst = om.readValue(string, JSONArray.class);
        System.out.println("lst = " + lst);
        for(int i=0 ; i<lst.toArray().length;i++) {
            System.out.println("i = " + i);
            Map map = (Map) lst.get(i);

            if (map.get("queueType").equals("RANKED_SOLO_5x5")) {


                si.setTier(map.get("tier").toString());
                si.setRank(map.get("rank").toString());
            }
        }

        return si;
    }


    public ModelAndView getSummonerGameRecode(String champ_name,ModelAndView mav) throws Exception {
        SummonerInfo si=new SummonerInfo();
        si=getSummonerInfo(champ_name);

        /*List<RecodeGame> recodeGameList =new ArrayList<>();
        recodeGameList=getGameRecode(si.getPuuid());*/

        //mav.addObject("recodeGameList",recodeGameList);
        mav.addObject("si",si);
        mav.setViewName("info");






        return mav;

    }

    public List<RecodeGame> getGameRecode(String puuid) {

        List<RecodeGame> recodeGames = new ArrayList<>();
        String riot_api_key="RGAPI-e2c3b20e-ae8c-462e-868a-8e7185c9b12f";

        String url1="https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/"+puuid+ "/ids?api_key="+riot_api_key+"&start=0&count=20";
        URL get_url1=null;
        try {
            get_url1= new URL(url1);
            HttpURLConnection conn1= (HttpURLConnection) get_url1.openConnection();
            conn1.setRequestMethod("GET");
            conn1.setRequestProperty("Content-type","application/json");
            System.out.println("response code : "+conn1.getResponseCode());
            BufferedReader rd1;
            if(conn1.getResponseCode() >= 200 && conn1.getResponseCode() <= 300) {
                rd1 = new BufferedReader(new InputStreamReader(conn1.getInputStream()));
            } else {
                rd1 = new BufferedReader(new InputStreamReader(conn1.getErrorStream()));
            }
            // 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
            StringBuilder sb1 = new StringBuilder();
            String line1;
            while ((line1 = rd1.readLine()) != null) {
                sb1.append(line1);
            }
            // 10. 객체 해제.
            rd1.close();
            conn1.disconnect();
            JSONParser parser1 = new JSONParser();
            // 2. 문자열을 JSON 형태로 JSONObject 객체에 저장.
            List<String> obj1 = (List<String>) parser1.parse(sb1.toString());
            System.out.println("obj1 = " + obj1);
            String[] riot_api_list =new String[5];

            riot_api_list[0]="RGAPI-e2c3b20e-ae8c-462e-868a-8e7185c9b12f";
            riot_api_list[1]="RGAPI-c3e0d6de-963c-4068-a9ed-d38a11a63d7c";
            riot_api_list[2]="RGAPI-8713e443-0ba8-4f91-a543-3ef8c87d3fa3";
            riot_api_list[3]="RGAPI-5ad73e8f-a1c8-44ef-b479-bd6beab2610e";
            riot_api_list[4]="RGAPI-73b0d597-e605-41d1-8ad8-175ba2a6ab02";


            //char[]="RGAPI-e2c3b20e-ae8c-462e-868a-8e7185c9b12f, RGAPI-c3e0d6de-963c-4068-a9ed-d38a11a63d7c, RGAPI-8713e443-0ba8-4f91-a543-3ef8c87d3fa3, RGAPI-5ad73e8f-a1c8-44ef-b479-bd6beab2610e, RGAPI-73b0d597-e605-41d1-8ad8-175ba2a6ab02".split(",");

            for(int i=0;i<obj1.size();i++){
                RecodeGame recodeGame=new RecodeGame();
                recodeGame.setGameid(obj1.get(i));




                String gameid= obj1.get(i);
                String url2="https://asia.api.riotgames.com/lol/match/v5/matches/"+gameid+"?api_key="+riot_api_list[(int) (Math.random()*riot_api_list.length)];
                URL get_url2=null;
                get_url2=new URL(url2);
                HttpURLConnection conn2= (HttpURLConnection) get_url2.openConnection();
                conn2.setRequestMethod("GET");
                conn2.setRequestProperty("Content-type","application/json");
                System.out.println("response code : "+conn2.getResponseCode());
                BufferedReader rd2;
                if(conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
                    rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
                } else {
                    rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
                }
                // 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
                StringBuilder sb2 = new StringBuilder();
                String line2;
                while ((line2 = rd2.readLine()) != null) {
                    sb2.append(line2);
                }
                // 10. 객체 해제.
                rd2.close();
                conn2.disconnect();
                JSONParser parser2 = new JSONParser();
                // 2. 문자열을 JSON 형태로 JSONObject 객체에 저장.
                JSONObject obj2 = (JSONObject)parser2.parse(sb2.toString());
                Map matchinfo= (Map) obj2.get("info");

                //timeline
                String url3="https://asia.api.riotgames.com/lol/match/v5/matches/"+gameid+"/timeline?api_key="+riot_api_list[(int) (Math.random()*riot_api_list.length)];
                URL get_url3=null;
                get_url3=new URL(url3);
                HttpURLConnection conn3= (HttpURLConnection) get_url3.openConnection();
                conn3.setRequestMethod("GET");
                conn3.setRequestProperty("Content-type","application/json");
                System.out.println("response code : "+conn3.getResponseCode());
                BufferedReader rd3;
                if(conn3.getResponseCode() >= 200 && conn3.getResponseCode() <= 300) {
                    rd3 = new BufferedReader(new InputStreamReader(conn3.getInputStream()));
                } else {
                    rd3 = new BufferedReader(new InputStreamReader(conn3.getErrorStream()));
                }
                // 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
                StringBuilder sb3 = new StringBuilder();
                String line3;
                while ((line3 = rd3.readLine()) != null) {
                    sb3.append(line3);
                }
                // 10. 객체 해제.
                rd3.close();
                conn3.disconnect();
                JSONParser parser3 = new JSONParser();
                // 2. 문자열을 JSON 형태로 JSONObject 객체에 저장.
                JSONObject obj3 = (JSONObject)parser3.parse(sb3.toString());
                Map timelineinfo= (Map) obj3.get("info");

                recodeGame.setGameversion((String)matchinfo.get("gameVersion"));
                recodeGame.setGamemode((String) matchinfo.get("gameMode"));
                //게임정보 가져오기
                List<RecodeGameTeam> recodeGameTeams=getRecodeGame(matchinfo,timelineinfo);
                //기본적인 게임 리코드 dto객체 저장
                double start=Double.parseDouble(String.valueOf(matchinfo.get("gameStartTimestamp")));
                double end=Double.parseDouble(String.valueOf(matchinfo.get("gameEndTimestamp")));
                recodeGame.setGametime( (end-start)/100 );
                recodeGame.setGameversion((String)matchinfo.get("gameVersion"));
                recodeGame.setGamemode((String) matchinfo.get("gameMode"));
                recodeGame.setStarttime(start/100);
                recodeGame.setRecodeGameTeams(recodeGameTeams);
                recodeGames.add(recodeGame);
            }



        } catch (Exception e) {
            e.printStackTrace();
        }


        return recodeGames;

    }




    public List<RecodeGameTeam> getRecodeGame(Map matchinfo, Map timelineinfo) {
        List<RecodeGameTeam> recodeGameTeams=new ArrayList<>();
        List teams=(List) matchinfo.get("teams");
        List frames=(List) timelineinfo.get("frames");

        //팀별 정보 가져오기
        for(int i=0;i< teams.size();i++){

            RecodeGameTeam recodeGameTeam=new RecodeGameTeam();

            Map teamInfo=(Map)teams.get(i);
            System.out.println("teamId= " + teamInfo.get("teamId"));
            recodeGameTeam.setTeamid(Integer.parseInt(String.valueOf(teamInfo.get("teamId"))));
            Map teamKills=(Map) teamInfo.get("objectives");

            Map baronKills=(Map) teamKills.get("baron");
            Map championKills=(Map) teamKills.get("champion");
            Map dragonKills=(Map) teamKills.get("dragon");
            Map riftHeraldKills=(Map) teamKills.get("riftHerald");
            Map towerKills=(Map) teamKills.get("tower");
            List bans=(List) teamInfo.get("bans");




            recodeGameTeam.setChampion_kills(Integer.parseInt(String.valueOf(championKills.get("kills"))));
            recodeGameTeam.setBaron_kills(Integer.parseInt(String.valueOf(baronKills.get("kills"))));
            recodeGameTeam.setDragon_kills(Integer.parseInt(String.valueOf(dragonKills.get("kills"))) );
            recodeGameTeam.setRiftherald_kills(Integer.parseInt(String.valueOf(riftHeraldKills.get("kills"))) );
            recodeGameTeam.setTower_kills(Integer.parseInt(String.valueOf(towerKills.get("kills"))) );
            List<Integer> banList=new ArrayList<>();
            for (int j=0; j<bans.size(); j++){

                Map ban=(Map) bans.get(j);
                banList.add(Integer.parseInt(String.valueOf(ban.get("championId"))) );
            }
            recodeGameTeam.setBans(banList);
            recodeGameTeam.setWin((Boolean) teamInfo.get("win"));
            List<RecodeGameSummoner> recodeGameSummoners=new ArrayList<>();
            List participant=(List) matchinfo.get("participants");
            int totalGold=0;
            for (int j=0;j<participant.size();j++){
                Map person=(Map) participant.get(j);
                if(Integer.parseInt(String.valueOf(person.get("teamId"))) ==recodeGameTeam.getTeamid()) {
                    RecodeGameSummoner recodeGameSummoner = new RecodeGameSummoner();
                    recodeGameSummoner.setParticitantid(Integer.parseInt(String.valueOf(person.get("participantId"))));
                    recodeGameSummoner.setChampionlevel(Integer.parseInt(String.valueOf( person.get("champLevel"))));
                    recodeGameSummoner.setChampionid(Integer.parseInt(String.valueOf(person.get("championId"))) );
                    recodeGameSummoner.setSummonername(String.valueOf(person.get("summonerName")) );
                    recodeGameSummoner.setTeamposion(String.valueOf(person.get("teamPosition")) );
                    recodeGameSummoner.setKills(Integer.parseInt(String.valueOf(person.get("kills"))) );
                    double kills= Integer.parseInt(String.valueOf(person.get("kills"))) ;
                    recodeGameSummoner.setDeaths(Integer.parseInt(String.valueOf(person.get("deaths"))));
                    double deaths= Integer.parseInt(String.valueOf(person.get("deaths"))) ;
                    recodeGameSummoner.setAssists(Integer.parseInt(String.valueOf(person.get("assists"))));
                    double assists= Integer.parseInt(String.valueOf(person.get("assists")));
                    recodeGameSummoner.setKda((kills+assists)/deaths);
                    recodeGameSummoner.setTotaldamagedealttochampions(Integer.parseInt(String.valueOf(person.get("totalDamageDealtToChampions"))) );
                    recodeGameSummoner.setWardsplaced(Integer.parseInt(String.valueOf(person.get("wardsPlaced"))) );
                    recodeGameSummoner.setGoldearned(Integer.parseInt(String.valueOf(person.get("goldEarned"))) );
                    totalGold += Integer.parseInt(String.valueOf(person.get("goldEarned")));
                    Map perks= (Map) person.get("perks");
                    Map statPerks= (Map) perks.get("statPerks");
                    List styles= (List) perks.get("styles");
                    Map style1= (Map) styles.get(0);
                    Map style2= (Map) styles.get(1);
                    List perkselect1= (List) style1.get("selections");
                    List perkselect2= (List) style2.get("selections");
                    Map perkselect1_1=(Map) perkselect1.get(0);
                    Map perkselect1_2=(Map) perkselect1.get(1);
                    Map perkselect1_3=(Map) perkselect1.get(2);
                    Map perkselect1_4=(Map) perkselect1.get(3);
                    Map perkselect2_1=(Map) perkselect2.get(0);
                    Map perkselect2_2=(Map) perkselect2.get(1);
                    PerkBuild perkBuild=new PerkBuild();
                    Flex flex=new Flex();
                    flex.setOffense(Integer.parseInt(String.valueOf(statPerks.get("offense"))) );
                    flex.setDefense(Integer.parseInt(String.valueOf(statPerks.get("defense"))) );
                    flex.setFlex(Integer.parseInt(String.valueOf(statPerks.get("flex"))) );
                    perkBuild.setFlexes(flex);
                    perkBuild.setStyle1(String.valueOf(style1.get("style")) );
                    perkBuild.setStyle2(String.valueOf(style2.get("style")) );
                    Perk1 perk1=new Perk1();
                    perk1.setPerk1_1(Integer.parseInt(String.valueOf(perkselect1_1.get("perk"))) );
                    perk1.setPerk1_2(Integer.parseInt(String.valueOf(perkselect1_2.get("perk"))));
                    perk1.setPerk1_3(Integer.parseInt(String.valueOf(perkselect1_3.get("perk"))));
                    perk1.setPerk1_4(Integer.parseInt(String.valueOf(perkselect1_4.get("perk"))));
                    perkBuild.setPerk1s(perk1);
                    Perk2 perk2=new Perk2();
                    perk2.setPerk2_1(Integer.parseInt(String.valueOf(perkselect2_1.get("perk"))) );
                    perk2.setPerk2_2(Integer.parseInt(String.valueOf(perkselect2_2.get("perk"))) );
                    perkBuild.setPerk2s(perk2);
                    recodeGameSummoner.setPerkBuild(perkBuild);
                    ItemBuild itemBuild=new ItemBuild();
                    SkillBuild skillBuild= new SkillBuild();
                    EndItem endItem=new EndItem();
                    endItem.setItem0(Integer.parseInt(String.valueOf(person.get("item0"))) );
                    endItem.setItem1(Integer.parseInt(String.valueOf(person.get("item1"))));
                    endItem.setItem2(Integer.parseInt(String.valueOf(person.get("item2"))));
                    endItem.setItem3(Integer.parseInt(String.valueOf(person.get("item3"))));
                    endItem.setItem4(Integer.parseInt(String.valueOf(person.get("item4"))));
                    endItem.setItem5(Integer.parseInt(String.valueOf(person.get("item5"))));
                    endItem.setItem6(Integer.parseInt(String.valueOf(person.get("item6"))));
                    recodeGameSummoner.setEndItem(endItem);
                    List<Integer> skilltree=new ArrayList<>();
                    List<Integer> itemtree=new ArrayList<>();

                    for(int z=0;z< frames.size();z++){
                        Map frame=(Map) frames.get(z);
                        List events=(List) frame.get("events");
                        for(int x=0 ; x<events.size();x++){
                            Map ent=(Map) events.get(x);
                            String levelType=String.valueOf(ent.get("levelUpType"));
                            String type=String.valueOf(ent.get("type"));
                            int personid;
                            if(String.valueOf(ent.get("participantId")).equals("null")) {
                                personid = 0;
                            }else {
                                personid = Integer.parseInt(String.valueOf(ent.get("participantId")));
                            }
                            if(levelType.equals("NORMAL") ){
                                if (personid==recodeGameSummoner.getParticitantid()) {

                                    skilltree.add(Integer.parseInt(String.valueOf(ent.get("skillSlot"))));
                                }
                                /*int part=Integer.parseInt(String.valueOf(ent.get("participantId")));
                                if(recodeGameSummoner.getParticitantid().equals(part)){
                                    System.out.println("1");
                                }*/
                            }else if(type.equals("ITEM_PURCHASED")){
                                if (personid== recodeGameSummoner.getParticitantid()) {

                                    itemtree.add(Integer.parseInt(String.valueOf(ent.get("itemId"))));
                                }
                            }

                        }
                    }
                    //System.out.println(skilltree);
                    skillBuild.setSkill_tree(skilltree);
                    itemBuild.setPitem_build(itemtree);
                    recodeGameSummoner.setSkillBuild(skillBuild);
                    recodeGameSummoner.setItemBuild(itemBuild);
                    recodeGameSummoners.add(recodeGameSummoner);









                }
                recodeGameTeam.setRecodeGameSummoners(recodeGameSummoners);
                recodeGameTeam.setTeamtotalgold(totalGold);
            }




            recodeGameTeams.add(recodeGameTeam);
        }

        return recodeGameTeams;
    }
}