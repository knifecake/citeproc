Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_CreepingAddNames to pass

  @citation @bugreports @citations
  Scenario: Creeping Add Names
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0">
       <info>
          <title>American Sociological Association</title>
          <id>http://www.zotero.org/styles/asa</id>
          <link href="http://www.zotero.org/styles/asa" rel="self"/>
          <author>
             <name>Julian Onions</name>
             <email>julian.onions@gmail.com</email>
          </author>
          <category citation-format="author-date"/>
          <category field="sociology"/>
          <updated>2008-10-20T16:32:11+00:00</updated>
          <summary>The ASA style.</summary>
          <link href="http://www.asanet.org/galleries/default-file/asaguidelinesnew.pdf" rel="documentation"/>
       </info>
       <macro name="editor">
          <names variable="editor">
             <label form="verb" text-case="lowercase" suffix=" "/>
             <name and="text" delimiter=", "/>
          </names>
       </macro>
       <macro name="series-editor">
          <names variable="original-author">
             <label form="short" text-case="capitalize-first" suffix=". " strip-periods="true"/>
             <name and="text" delimiter=", "/>
          </names>
       </macro>
       <macro name="anon">
          <text term="anonymous" form="short" text-case="capitalize-first" strip-periods="true"/>
       </macro>
       <macro name="author">
          <names variable="author">
             <name and="text" name-as-sort-order="first" sort-separator=", " delimiter=", " delimiter-precedes-last="always"/>
             <label form="short" prefix=", " suffix="." text-case="lowercase" strip-periods="true"/>
             <substitute>
                <names variable="editor"/>
                <names variable="translator"/>
                <text macro="anon"/>
             </substitute>
          </names>
       </macro>
       <macro name="author-short">
          <names variable="author">
             <name form="short" and="text" delimiter=", "/>
             <substitute>
                <names variable="editor"/>
                <names variable="translator"/>
                <text macro="anon"/>
             </substitute>
          </names>
       </macro>
       <macro name="access">
          <group>
             <text variable="URL"/>
             <group prefix=" (" suffix=")">
                <text term="accessed" text-case="capitalize-first" suffix=" "/>
                <date variable="accessed">
                   <date-part name="month" suffix=" "/>
                   <date-part name="day" suffix=", "/>
                   <date-part name="year"/>
                </date>
             </group>
          </group>
       </macro>
       <macro name="title">
          <choose>
             <if type="thesis">
                <text variable="title"/>
             </if>
             <else-if type="bill book graphic legal_case motion_picture report song" match="any">
                <text variable="title" font-style="italic"/>
             </else-if>
             <else>
                <text variable="title" quotes="true"/>
             </else>
          </choose>
       </macro>
       <macro name="publisher">
          <group delimiter=": ">
             <text variable="publisher-place"/>
             <text variable="publisher"/>
          </group>
       </macro>
       <macro name="year-date">
          <choose>
             <if variable="issued">
                <date variable="issued">
                   <date-part name="year"/>
                </date>
             </if>
             <else>
                <text term="no date" form="short" strip-periods="true"/>
             </else>
          </choose>
       </macro>
       <macro name="day-month">
          <date variable="issued">
             <date-part name="month"/>
             <date-part name="day" prefix=" "/>
          </date>
       </macro>
       <macro name="pages">
          <label variable="page" form="short" suffix=". " text-case="capitalize-first" strip-periods="true"/>
          <text variable="page"/>
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
       <citation et-al-min="4" et-al-use-first="1" et-al-subsequent-min="3" et-al-subsequent-use-first="1" disambiguate-add-year-suffix="true" disambiguate-add-names="true" disambiguate-add-givenname="true" collapse="year">
          <layout prefix="(" suffix=")" delimiter="; ">
             <group delimiter=":">
                <group delimiter=" ">
                   <text macro="author-short"/>
                   <text macro="year-date"/>
                </group>
                <text variable="locator"/>
             </group>
          </layout>
       </citation>
       <bibliography hanging-indent="true" et-al-min="6" et-al-use-first="1">
          <sort>
             <key macro="author"/>
             <key variable="title"/>
          </sort>
          <layout suffix=".">
             <group delimiter=" ">
                <text macro="author" suffix="."/>
                <text macro="year-date" suffix="."/>
             </group>
             <choose>
                <if type="article-newspaper article-magazine" match="any">
                   <group delimiter=" ">
                      <text macro="title" prefix=" " suffix="."/>
                   </group>
                   <group prefix=" " delimiter=", ">
                      <text variable="container-title" font-style="italic"/>
                      <text macro="day-month"/>
                      <text variable="edition"/>
                      <text variable="page"/>
                   </group>
                </if>
                <else-if type="thesis">
                   <text macro="title" prefix=" " suffix="." quotes="true"/>
                   <group prefix=" " delimiter=", ">
                      <text macro="edition"/>
                      <text macro="editor" suffix="."/>
                      <text variable="genre"/>
                      <text macro="publisher"/>
                   </group>
                </else-if>
                <else-if type="bill book graphic legal_case motion_picture report song" match="any">
                   <group delimiter=" ">
                      <text macro="title" prefix=" " suffix="."/>
                      <text macro="edition"/>
                      <text macro="editor" suffix="."/>
                      <text macro="publisher"/>
                   </group>
                </else-if>
                <else-if type="chapter paper-conference" match="any">
                   <group delimiter=" ">
                      <text macro="title" prefix=" " suffix="."/>
                      <group delimiter=", " suffix=".">
                         <group delimiter=" ">
                            <text macro="pages"/>
                            <text term="in" text-case="lowercase"/>
                            <text variable="container-title" font-style="italic"/>
                         </group>
                         <text variable="volume" prefix="vol. "/>
                         <text variable="collection-title" font-style="italic"/>
                         <text macro="editor"/>
                      </group>
                      <text macro="publisher"/>
                   </group>
                </else-if>
                <else>
                   <group suffix=".">
                      <text macro="title" prefix=" "/>
                      <text macro="editor" prefix=" "/>
                   </group>
                   <group prefix=" " suffix="." delimiter=" ">
                      <text variable="container-title" font-style="italic"/>
                      <group delimiter=":">
                         <text variable="volume"/>
                         <text variable="page"/>
                      </group>
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
    [{"author":[{"family":"Morley","given":"John"},{"family":"King","given":"Richard"},{"family":"Gadget","given":"Tom"},{"family":"Widget","given":"Peter"}],"id":"ITEM-1","issued":{"date-parts":[["2011"]]},"type":"book"},{"author":[{"family":"Butler","given":"Sharon"},{"family":"Turner","given":"Sarah"}],"id":"ITEM-2","issued":{"date-parts":[["2010"]]},"type":"book"},{"author":[{"family":"Rowan","given":"Steven"},{"family":"Peel","given":"Artemus"},{"family":"Vendeville","given":"Bruce"}],"id":"ITEM-3","issued":{"date-parts":[["2004"]]},"type":"book"}]
    """
    And I have a citations input
    When I cite all items
    Then the result should be:
    """
    >>[0] (Morley et al. 2011; Butler and Turner 2010; Rowan, Peel, and Vendeville 2004)
    """
