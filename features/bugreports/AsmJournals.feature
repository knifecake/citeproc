Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_AsmJournals to pass

  @bibliography @bugreports
  Scenario: Asm Journals
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0">
       <info>
          <title>American Society for Microbiology</title>
          <id>http://www.zotero.org/styles/asm-journals</id>
          <link href="http://www.zotero.org/styles/asm-journals" rel="self"/>
          <author>
             <name>Julian Onions</name>
             <email>julian.onions@gmail.com</email>
          </author>
          <contributor>
             <name>Rintze Zelle</name>
             <uri>http://forums.zotero.org/account/831/</uri>
          </contributor>
          <contributor>
             <name>Richard Karnesky</name>
             <email>karnesky+zotero@gmail.com</email>
             <uri>http://arc.nucapt.northwestern.edu/Richard_Karnesky</uri>
          </contributor>
          <category citation-format="numeric"/>
          <category field="biology"/>
          <updated>2008-05-07T12:08:52+00:00</updated>
          <summary>Style for all American Society for Microbiology journals.</summary>
          <link href="http://aem.asm.org/cgi/content/full/74/1/1#References." rel="documentation"/>
          <rights>This work is licensed under a Creative Commons Attribution-Share Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/</rights>
       </info>
       <macro name="author">
          <names variable="author" suffix=".">
             <name sort-separator=", " initialize-with=". " and="text" font-weight="bold" name-as-sort-order="first" delimiter=", " delimiter-precedes-last="always"/>
          </names>
       </macro>
       <macro name="issued">
          <group prefix=" " suffix=".">
             <choose>
                <if type="patent">
                   <date variable="issued">
                      <date-part name="month" suffix=" "/>
                      <date-part name="year"/>
                   </date>
                </if>
                <else>
                   <date variable="issued">
                      <date-part name="year"/>
                   </date>
                </else>
             </choose>
          </group>
       </macro>
       <macro name="chapter-specifics">
          <choose>
             <if type="chapter paper-conference" match="any">
                <label variable="page" form="short" plural="never" prefix=", " suffix=" "/>
                <text variable="page"/>
                <text term="in" text-case="capitalize-first" prefix=". " suffix=" " font-style="italic"/>
                <names variable="editor" delimiter=", " suffix=", ">
                   <name initialize-with="." delimiter=", " delimiter-precedes-last="always" and="text"/>
                   <label form="short" prefix=" (" suffix=".)" strip-periods="true"/>
                </names>
             </if>
          </choose>
       </macro>
       <macro name="patent-specifics">
          <text variable="number" prefix=". U.S. Patent "/>
       </macro>
       <macro name="container-title">
          <choose>
             <if type="bill book graphic legal_case motion_picture report song chapter paper-conference" match="any">
                <text variable="container-title"/>
             </if>
             <else>
                <text variable="container-title" form="short" prefix=". "/>
             </else>
          </choose>
       </macro>
       <macro name="edition">
          <choose>
             <if is-numeric="edition">
                <group delimiter=" " prefix=", ">
                   <number variable="edition" form="ordinal"/>
                   <text term="edition" form="short" suffix="." strip-periods="true"/>
                </group>
             </if>
             <else>
                <text variable="edition" suffix="."/>
             </else>
          </choose>
       </macro>
       <macro name="publisher">
          <group delimiter=", " prefix=". ">
             <text variable="genre"/>
             <text variable="publisher"/>
             <text variable="publisher-place"/>
          </group>
       </macro>
       <macro name="locators">
          <choose>
             <if type="article-journal">
                <group prefix=" " delimiter=":">
                   <text variable="volume" font-weight="bold"/>
                   <text variable="page"/>
                </group>
             </if>
          </choose>
       </macro>
       <citation collapse="citation-number">
          <sort>
             <key variable="citation-number"/>
          </sort>
          <layout prefix="(" suffix=")" delimiter=", ">
             <text variable="citation-number"/>
          </layout>
       </citation>
       <bibliography entry-spacing="0" second-field-align="flush">
          <sort>
             <key variable="author"/>
             <key variable="title"/>
          </sort>
          <layout suffix=".">
             <text variable="citation-number" suffix=". "/>
             <text macro="author"/>
             <text macro="issued"/>
             <text variable="title" prefix=" "/>
             <text macro="chapter-specifics"/>
             <text macro="patent-specifics"/>
             <text macro="container-title"/>
             <text macro="edition"/>
             <text macro="publisher"/>
             <text macro="locators"/>
          </layout>
       </bibliography>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe Co.","isInstitution":true}],"id":"ITEM-1","issued":{"date-parts":[["1965","6","1"]]},"title":"His Collectively Anonymous Life","type":"book"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">
        <div class="csl-left-margin">1. </div><div class="csl-right-inline"><b>Doe Co.</b> 1965. His Collectively Anonymous Life.</div>
      </div>
    </div>
    """
