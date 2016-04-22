Feature: sort
  As a CSL cite processor hacker
  I want the test sort_WithAndInOneEntry to pass

  @citation @sort @citations
  Scenario: With And In One Entry
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" demote-non-dropping-particle="sort-only">
       <info>
          <title>American Political Science Association</title>
          <id>http://www.zotero.org/styles/apsa</id>
          <link href="http://www.zotero.org/styles/apsa" rel="self"/>
          <author>
             <name>Julian Onions</name>
             <email>julian.onions@gmail.com</email>
          </author>
          <contributor>
             <name>Sebastian Karcher</name>
          </contributor>
          <category citation-format="author-date"/>
          <category field="political_science"/>
          <updated>2010-07-26T02:21:30+00:00</updated>
          <summary>The American Political Science Association style.</summary>
          <link href="http://www.ipsonet.org/data/files/APSAStyleManual2006.pdf" rel="documentation"/>
          <rights>This work is licensed under a Creative Commons Attribution-Share Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/</rights>
       </info>
       <macro name="editor">
          <names variable="editor" delimiter=", ">
             <label form="short" text-case="lowercase" suffix=". " strip-periods="true"/>
             <name and="text" delimiter=", "/>
          </names>
       </macro>
       <macro name="author">
          <names variable="author">
             <name name-as-sort-order="first" and="text" sort-separator=", " delimiter=", " delimiter-precedes-last="always"/>
             <label form="short" prefix=", " suffix="." text-case="lowercase" strip-periods="true"/>
             <substitute>
                <names variable="editor"/>
                <text macro="title"/>
             </substitute>
          </names>
       </macro>
       <macro name="author-short">
          <names variable="author">
             <name form="short" and="text" delimiter=", " initialize-with=". " sort-separator=", "/>
             <substitute>
                <names variable="editor"/>
                <names variable="translator"/>
                <text macro="title"/>
             </substitute>
          </names>
       </macro>
       <macro name="access">
          <choose>
             <if type="legal_case" match="none">
                <choose>
                   <if variable="URL">
                      <group delimiter=" ">
                         <text variable="URL"/>
                         <group prefix="(" suffix=")">
                            <text term="accessed" text-case="capitalize-first" suffix=" "/>
                            <date variable="accessed">
                               <date-part name="month" suffix=" "/>
                               <date-part name="day" suffix=", "/>
                               <date-part name="year"/>
                            </date>
                         </group>
                      </group>
                   </if>
                </choose>
             </if>
          </choose>
       </macro>
       <macro name="title">
          <choose>
             <if type="bill book graphic legal_case motion_picture report song" match="any">
                <text variable="title" font-style="italic"/>
             </if>
             <else>
                <text variable="title" quotes="true"/>
             </else>
          </choose>
       </macro>
       <macro name="legal_case">
          <group prefix=" " delimiter=" ">
             <text variable="volume"/>
             <text variable="container-title"/>
             <text variable="page"/>
          </group>
          <text variable="authority" prefix=" (" suffix=")"/>
       </macro>
       <macro name="publisher">
          <choose>
             <if type="thesis" match="none">
                <group delimiter=": ">
                   <text variable="publisher-place"/>
                   <text variable="publisher"/>
                </group>
                <text variable="genre" prefix=". "/>
             </if>
             <else>
                <group delimiter=". ">
                   <text variable="genre"/>
                   <text variable="publisher"/>
                </group>
             </else>
          </choose>
       </macro>
       <macro name="year-date">
          <choose>
             <if variable="issued">
                <date variable="issued">
                   <date-part name="year"/>
                </date>
             </if>
             <else>
                <text term="no date" form="short"/>
             </else>
          </choose>
       </macro>
       <macro name="edition">
          <choose>
             <if is-numeric="edition">
                <group delimiter=" ">
                   <number variable="edition" form="ordinal"/>
                   <text term="edition" form="short" suffix="." strip-periods="true"/>
                </group>
             </if>
             <else>
                <text variable="edition" suffix="."/>
             </else>
          </choose>
       </macro>
       <macro name="locator">
          <choose>
             <if locator="page">
                <text variable="locator"/>
             </if>
             <else>
                <group delimiter=" ">
                   <label variable="locator" form="short"/>
                   <text variable="locator"/>
                </group>
             </else>
          </choose>
       </macro>
       <citation et-al-min="4" et-al-use-first="1" disambiguate-add-year-suffix="true" disambiguate-add-names="true" disambiguate-add-givenname="true" collapse="year">
          <sort>
             <key macro="author-short"/>
             <key macro="year-date"/>
          </sort>
          <layout prefix="(" suffix=")" delimiter="; ">
             <group delimiter=", ">
                <group delimiter=" ">
                   <text macro="author-short"/>
                   <text macro="year-date"/>
                </group>
                <text macro="locator"/>
             </group>
          </layout>
       </citation>
       <bibliography hanging-indent="true" et-al-min="4" et-al-use-first="1" subsequent-author-substitute="———">
          <sort>
             <key macro="author"/>
             <key variable="title"/>
          </sort>
          <layout suffix=".">
             <text macro="author" suffix="."/>
             <date variable="issued" prefix=" " suffix=".">
                <date-part name="year"/>
             </date>
             <choose>
                <if type="bill book graphic legal_case motion_picture report song manuscript thesis" match="any">
                   <text macro="legal_case"/>
                   <group prefix=" " delimiter=" ">
                      <text macro="title" suffix="."/>
                      <text macro="edition"/>
                      <text macro="editor" suffix="."/>
                   </group>
                   <text prefix=" " suffix="." macro="publisher"/>
                </if>
                <else-if type="chapter paper-conference" match="any">
                   <text macro="title" prefix=" " suffix="."/>
                   <group prefix=" " delimiter=" ">
                      <text term="in" text-case="capitalize-first"/>
                      <text variable="container-title" font-style="italic" suffix=","/>
                      <text variable="collection-title" suffix=","/>
                      <text macro="editor" suffix="."/>
                      <group suffix=".">
                         <text macro="publisher"/>
                         <group prefix=", ">
                            <text variable="page" prefix="p. "/>
                         </group>
                      </group>
                   </group>
                </else-if>
                <else>
                   <group prefix=" " delimiter=" " suffix=".">
                      <text macro="title"/>
                      <text macro="editor"/>
                   </group>
                   <group prefix=" " suffix=".">
                      <text variable="container-title" font-style="italic"/>
                      <group prefix=" ">
                         <text variable="volume"/>
                         <text variable="issue" prefix="(" suffix=")"/>
                      </group>
                      <text variable="page" prefix=": "/>
                   </group>
                </else>
             </choose>
             <text prefix=" " macro="access" suffix="."/>
          </layout>
       </bibliography>
    </style>
    """
    And the following input:
    """
    [{"abstract":"This article compares a variety of models of presidential approval in terms of their dynamic properties and their theoretical underpinnings. Exponential distributed lags, partial adjustment, error correction, and transfer function models are considered. The major difference between the models lies in interpretation rather than statistical properties. The error correction model seems most satisfactory. Approval models based on individual level theories are examined, and found to give no additional purchase.","accessed":{"date-parts":[[2011,9,20]]},"author":[{"family":"Beck","given":"Nathaniel","isInstitution":""}],"container-title":"Political Analysis","id":315,"issue":"1","issued":{"date-parts":[[1991,1,1]]},"multi":{"_keys":{}},"page":"51-87","shortTitle":"Comparing Dynamic Specifications","title":"Comparing Dynamic Specifications: The Case of Presidential Approval","type":"article-journal","volume":"3"},{"author":[{"family":"Beck","given":"Nathaniel","isInstitution":""},{"family":"Katz","given":"Jonathan","isInstitution":""}],"container-title":"International Organization","id":313,"issue":"2","issued":{"date-parts":[[2001]]},"multi":{"_keys":{}},"page":"487-495","shortTitle":"Throwing Out the Baby with the Bath Water","title":"Throwing Out the Baby with the Bath Water: A Comment on Green, Kim, and Yoon","type":"article-journal","volume":"55"},{"accessed":{"date-parts":[[2011,4,4]]},"author":[{"family":"Beck","given":"Nathaniel","isInstitution":""},{"family":"Katz","given":"Jonathan","isInstitution":""}],"container-title":"Annual Review of Political Science","id":328,"issue":"1","issued":{"date-parts":[[2011]]},"journalAbbreviation":"Annu. Rev. Polit. Sci.","multi":{"_keys":{}},"page":"331-352","title":"Dynamics in Time Series Cross Section Data","type":"article-journal","volume":"14"},{"author":[{"family":"Beck","given":"Nathaniel","isInstitution":""},{"family":"Katz","given":"Jonathan","isInstitution":""},{"family":"Tucker","given":"Richard","isInstitution":""}],"container-title":"American Journal of Political Science","id":317,"issue":"4","issued":{"date-parts":[[1998]]},"multi":{"_keys":{}},"page":"1260-1288","title":"Taking Time Seriously: Time-Series-Cross-Section Analysis with a Binary Dependent Variable","type":"article-journal","volume":"42"},{"abstract":"<p>We address a well-known but infrequently discussed problem in the quantitative study of international conflict: Despite immense data collections, prestigious journals, and sophisticated analyses, empirical findings in the literature on international conflict are often unsatisfying. Many statistical results change from article to article and specification to specification. Accurate forecasts are nonexistent. In this article we offer a conjecture about one source of this problem: The causes of conflict, theorized to be important but often found to be small or ephemeral, are indeed tiny for the vast majority of dyads, but they are large, stable, and replicable wherever the ex ante probability of conflict is large. This simple idea has an unexpectedly rich array of observable implications, all consistent with the literature. We directly test our conjecture by formulating a statistical model that includes its critical features. Our approach, a version of a \"neural network\" model, uncovers some interesting structural features of international conflict and, as one evaluative measure, forecasts substantially better than any previous effort. Moreover, this improvement comes at little cost, and it is easy to evaluate whether the model is a statistical improvement over the simpler models commonly used.</p>","accessed":{"date-parts":[[2011,4,6]]},"author":[{"family":"Beck","given":"Nathaniel","isInstitution":""},{"family":"King","given":"Gary","isInstitution":""},{"family":"Zeng","given":"Langche","isInstitution":""}],"container-title":"American Political Science Review","id":327,"issue":"1","issued":{"date-parts":[[2000,3,1]]},"multi":{"_keys":{}},"note":"ArticleType: research-article / Full publication date: Mar., 2000 / Copyright © 2000 American Political Science Association","page":"21-35","shortTitle":"Improving Quantitative Studies of International Conflict","title":"Improving Quantitative Studies of International Conflict: A Conjecture","type":"article-journal","volume":"94"},{"author":[{"family":"Colaresi","given":"Michael P.","isInstitution":""}],"event-place":"Syracuse, NY","id":311,"issued":{"date-parts":[[2006,1,31]]},"multi":{"_keys":{}},"number-of-pages":"262","publisher":"Syracuse University Press","publisher-place":"Syracuse, NY","shortTitle":"Scare Tactics","title":"Scare Tactics: The Politics of International Rivalry","type":"book"},{"abstract":"Recently, a debate has begun concerning the relationship between conflict events over time between the same disputants. While research on rivalries and recurrent conflict suggest that crises are related over time, others (Gartzke and Simon 1999) doubt the empirical and theoretical foundations of this research. We agree with the critics that the proposition that conflicts between adversaries are related over time remains only weakly substantiated. To fill this lacuna, we test four hypotheses relating past crisis behavior and sequences to subsequent conflict, using International Crisis Behavior (ICB) project data. Our results support the serial crisis hypothesis and suggest that the probability of subsequent crises and wars increase with each past crisis. Our findings also reinforce the inclination to give more emphasis to the analysis of rivalries.","accessed":{"date-parts":[[2011,7,8]]},"author":[{"family":"Colaresi","given":"Michael P.","isInstitution":""},{"family":"Thompson","given":"William R.","isInstitution":""}],"container-title":"Journal of Politics","id":320,"issue":"4","issued":{"date-parts":[[2002]]},"multi":{"_keys":{}},"page":"1175-1198","shortTitle":"Hot Spots or Hot Hands?","title":"Hot Spots or Hot Hands? Serial Crisis Behavior, Escalating Risks, and Rivalry","type":"article-journal","volume":"64"},{"author":[{"family":"Colaresi","given":"Michael P.","isInstitution":""},{"family":"Rasler","given":"Karen","isInstitution":""},{"family":"Thompson","given":"William R.","isInstitution":""}],"edition":"1","id":318,"issued":{"date-parts":[[2007]]},"multi":{"_keys":{}},"publisher":"Cambridge University Press","shortTitle":"Strategic Rivalries in World Politics","title":"Strategic Rivalries in World Politics: Position, Space and Conflict Escalation","type":"book"},{"author":[{"family":"Gochman","given":"Charles S.","isInstitution":""}],"container-title":"International Interactions","id":323,"issue":"1-2","issued":{"date-parts":[[1993]]},"multi":{"_keys":{}},"page":"49-76","title":"The Evolution of Militarized Disputes","type":"article-journal","volume":"19"},{"abstract":"<p>The authors address the question of why some militarized interstate disputes evolve into wars, while others do not. They note from previous investigations that the probability of such disputes ending in war is associated with the types of bargaining behavior adopted by disputants. Particularly important are the degrees of escalation and reciprocity that characterize that behavior. This leads them to ask two questions: first, why do statesmen involved in militarized interstate disputes adopt the bargaining behavior they do?; second, what accounts for variations in outcomes for those disputes in which similar patterns of bargaining behavior are observed? Based upon an analysis of 30 militarized interstate disputes, the authors conclude that (1) escalation in interstate bargaining is strongly associated with the nature of the issues in contention and the types of threat of force initially employed in dispute bargaining, that (2) there exists an association between the relative capabilities of disputants and the degree of reciprocity in bargaining exchanges, and that (3) variations in the outcomes of disputes largely can be accounted for in terms of the interests at stake and the diplomacy of the great powers. These findings prove to be consistent with the basic tenets of political realism, and suggest that the behavior of decision makers engaged in militarized interstate disputes is generally rational in that they respond to cost-benefit considerations.","accessed":{"date-parts":[[2011,5,31]]},"author":[{"family":"Gochman","given":"Charles S.","isInstitution":""},{"family":"Leng","given":"Russell J.","isInstitution":""}],"container-title":"International Studies Quarterly","id":324,"issue":"1","issued":{"date-parts":[[1983,3,1]]},"multi":{"_keys":{}},"note":"ArticleType: research-article / Full publication date: Mar., 1983 / Copyright © 1983 The International Studies Association","page":"97-120","shortTitle":"Realpolitik and the Road to War","title":"Realpolitik and the Road to War: An Analysis of Attributes and Behavior","type":"article-journal","volume":"27"},{"abstract":"This article offers an empirical description and discussion of interstate conflict behavior. The basis is a recently completed data set consisting of all recorded instances of threats, displays, and uses of military force among states since 1816. We detail historical trends in the data and describe major dimensions of dispute behavior, including patterns of participation, duration, severity and escalation, regional distribution, and national dispute proneness. The following conclusions are suggested: First, patterns of dispute behavior have been more persistent over time than we often assume. Second, when these patterns have changed, the changes have been evolutionary in nature and have paralleled changes in the size and composition of the interstate system. Third, despite the diversity of the political units that constitute the interstate system, patterns of dispute behavior are generalizable across geographic boundaries.","accessed":{"date-parts":[[2011,5,30]]},"author":[{"family":"Gochman","given":"Charles S.","isInstitution":""},{"family":"Maoz","given":"Zeev","isInstitution":""}],"container-title":"Journal of Conflict Resolution","id":325,"issue":"4","issued":{"date-parts":[[1984,12,1]]},"multi":{"_keys":{}},"page":"585-616","title":"Militarized Interstate Disputes, 1816-1976","type":"article-journal","volume":"28"}]
    """
    And I have a citations input
    When I cite all items
    Then the result should be:
    """
    >>[0] (Beck 1991; Beck and Katz 2001, 2011; Beck, Katz, and Tucker 1998; Beck, King, and Zeng 2000; Colaresi 2006; Colaresi, Rasler, and Thompson 2007; Colaresi and Thompson 2002; Gochman 1993; Gochman and Leng 1983; Gochman and Maoz 1984)
    """
