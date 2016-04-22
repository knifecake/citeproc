Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_SortedIeeeItalicsFail to pass

  @bibliography @bugreports
  Scenario: Sorted Ieee Italics Fail
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" demote-non-dropping-particle="sort-only">
       <info>
           <title>IEEE - modified by Dan Sorin</title>
          <id>IEEE - Dan Sorin</id>
          <link href="http://www.zotero.org/styles/ieee" rel="self"/>
          <author>
             <name>Dan Sorin</name>
             <email>sorin@ee.duke.edu</email>
          </author>
          <category field="engineering"/>
          <category field="generic-base"/>
          <category citation-format="numeric"/>
          <updated>2011-05-12T00:16:08+00:00</updated>
          <rights>
    			This work is licensed under a Creative Commons Attribution-Share Alike 3.0 License:
    			http://creativecommons.org/licenses/by-sa/3.0/
    		</rights>
          <link href="http://www.ieee.org/portal/cms_docs_iportals/iportals/publications/authors/transjnl/stylemanual.pdf" rel="documentation"/>
          <link href="http://www.ieee.org/documents/auinfo07.pdf" rel="documentation"/>
       </info><!-- Macros -->
       <macro name="edition">
          <choose>
             <if type="bill book graphic legal_case motion_picture report song chapter paper-conference" match="any">
                <choose>
                   <if is-numeric="edition">
                      <group delimiter=" ">
                         <number variable="edition" form="ordinal"/>
                         <text term="edition" form="short" suffix="." strip-periods="true"/>
                      </group>
                   </if>
                   <else>
                      <text variable="edition" text-case="capitalize-first" suffix="."/>
                   </else>
                </choose>
             </if>
          </choose>
       </macro>
       <macro name="issued">
          <choose>
             <if type="article-journal">
                <date variable="issued">
                   <date-part name="month" form="short" suffix=". " strip-periods="true"/>
                   <date-part name="year" form="long"/>
                </date>
             </if>
             <else-if type="bill book graphic legal_case motion_picture report song thesis chapter paper-conference" match="any">
                <date variable="issued">
                   <date-part name="year" form="long"/>
                </date>
             </else-if>
             <else>
                <date variable="issued">
                   <date-part name="day" form="numeric-leading-zeros" suffix="-"/>
                   <date-part name="month" form="short" suffix="-" strip-periods="true"/>
                   <date-part name="year" form="long"/>
                </date>
             </else>
          </choose>
       </macro>
       <macro name="author">
          <names variable="author">
             <name initialize-with=". " delimiter=", " and="text"/>
             <label form="short" prefix=", " text-case="capitalize-first" suffix="." strip-periods="true"/>
             <substitute>
                <names variable="editor"/>
                <names variable="translator"/>
             </substitute>
          </names>
       </macro>
       <macro name="editor">
          <names variable="editor">
             <name initialize-with=". " delimiter=", " and="text"/>
             <label form="short" prefix=", " text-case="capitalize-first" suffix="." strip-periods="true"/>
          </names>
       </macro>
       <macro name="locators">
          <group delimiter=", ">
             <text macro="edition"/>
             <group delimiter=" ">
                <text term="volume" form="short" suffix="." strip-periods="true"/>
                <number variable="volume" form="numeric"/>
             </group>
             <group delimiter=" ">
                <number variable="number-of-volumes" form="numeric"/>
                <text term="volume" form="short" suffix="." plural="true" strip-periods="true"/>
             </group>
             <group delimiter=" ">
                <text term="issue" form="short" suffix="." strip-periods="true"/>
                <number variable="issue" form="numeric"/>
             </group>
          </group>
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
       <macro name="publisher">
          <choose>
             <if type="bill book graphic legal_case motion_picture report song chapter paper-conference" match="any">
                <text variable="publisher-place" suffix=": "/>
                <text variable="publisher"/>
             </if>
             <else>
                <text variable="publisher"/>
             </else>
          </choose>
       </macro>
       <macro name="event">
          <choose>
             <if type="paper-conference">
                <choose><!-- Published Conference Paper -->
                   <if variable="container-title">
                      <group delimiter=", ">
                         <text variable="container-title" prefix="in " font-style="italic"/>
                         <text variable="event-place"/>
                      </group>
                   </if><!-- Unpublished Conference Paper -->
                   <else>
                      <group delimiter=", ">
                         <text variable="event" prefix="presented at the "/>
                         <text variable="event-place"/>
                      </group>
                   </else>
                </choose>
             </if>
          </choose>
       </macro>
       <macro name="access">
          <choose>
             <if type="webpage">
                <choose>
                   <if variable="URL">
                      <group delimiter=". ">
                         <text value="[Online]"/>
                         <text variable="URL" prefix="Available: "/>
                         <group prefix="[" suffix="]">
                            <date variable="accessed" prefix="Accessed: ">
                               <date-part name="day" form="numeric-leading-zeros" suffix="-"/>
                               <date-part name="month" form="short" suffix="-" strip-periods="true"/>
                               <date-part name="year" form="long"/>
                            </date>
                         </group>
                      </group>
                   </if>
                </choose>
             </if>
          </choose>
       </macro>
       <macro name="page">
          <group>
             <label variable="page" form="short" suffix=". " strip-periods="true"/>
             <text variable="page"/>
          </group>
       </macro><!-- Citation -->
       <citation et-al-min="7" et-al-use-first="1" collapse="citation-number">
          <sort>
             <key variable="citation-number"/>
          </sort>
          <layout prefix="[" suffix="]" delimiter="], [">
             <text variable="citation-number"/>
          </layout>
       </citation><!-- Bibliography -->
       <bibliography et-al-min="7" et-al-use-first="1" entry-spacing="0" second-field-align="flush">
          <sort>
             <key macro="author"/>
             <key variable="issued"/>
          </sort>
          <layout suffix="."><!-- Citation Number -->
             <text variable="citation-number" prefix="[" suffix="]"/><!-- Author(s) -->
             <text macro="author" prefix=" " suffix=", "/><!-- Rest of Citation -->
             <choose><!-- Specific Formats -->
                <if type="article-journal">
                   <group delimiter=", ">
                      <text macro="title"/>
                      <text variable="container-title" font-style="italic"/>
                      <text macro="locators"/>
                      <text macro="page"/>
                      <text macro="issued"/>
                   </group>
                </if>
                <else-if type="paper-conference">
                   <group delimiter=", ">
                      <text macro="title"/>
                      <text macro="event"/>
                      <text macro="issued"/>
                      <text macro="locators"/>
                      <text macro="page"/>
                   </group>
                </else-if>
                <else-if type="thesis">
                   <group delimiter=", ">
                      <text macro="title"/>
                      <text variable="genre"/>
                      <text macro="publisher"/>
                      <text macro="issued"/>
                   </group>
                </else-if>
                <else-if type="webpage">
                   <group delimiter=", " suffix=". ">
                      <text macro="title"/>
                      <text variable="container-title" font-style="italic"/>
                      <text macro="issued"/>
                   </group>
                   <text macro="access"/>
                </else-if>
                <else-if type="patent">
                   <text macro="title" suffix=", "/>
                   <text variable="number" prefix="U.S. Patent "/>
                   <text macro="issued"/>
                </else-if><!-- Generic/Fallback Formats -->
                <else-if type="bill book graphic legal_case motion_picture report song" match="any">
                   <group delimiter=", " suffix=". ">
                      <text macro="title"/>
                      <text macro="locators"/>
                   </group>
                   <group delimiter=", ">
                      <text macro="publisher"/>
                      <text macro="issued"/>
                      <text macro="page"/>
                   </group>
                </else-if>
                <else-if type="article-journal article-magazine article-newspaper broadcast interview manuscript map patent personal_communication song speech thesis webpage" match="any">
                   <group delimiter=", ">
                      <text macro="title"/>
                      <text variable="container-title" font-style="italic"/>
                      <text macro="locators"/>
                      <text macro="publisher"/>
                      <text macro="page"/>
                      <text macro="issued"/>
                   </group>
                </else-if>
                <else-if type="chapter paper-conference" match="any">
                   <group delimiter=", " suffix=", ">
                      <text macro="title"/>
                      <text variable="container-title" prefix="in " font-style="italic"/>
                      <text macro="locators"/>
                   </group>
                   <text macro="editor" suffix=" "/>
                   <group delimiter=", ">
                      <text macro="publisher"/>
                      <text macro="issued"/>
                      <text macro="page"/>
                   </group>
                </else-if>
                <else>
                   <group delimiter=", " suffix=". ">
                      <text macro="title"/>
                      <text variable="container-title" font-style="italic"/>
                      <text macro="locators"/>
                   </group>
                   <group delimiter=", ">
                      <text macro="publisher"/>
                      <text macro="page"/>
                      <text macro="issued"/>
                   </group>
                </else>
             </choose>
          </layout>
       </bibliography>
    </style>

    """
    And the following input:
    """
    [{"author":[{"family":"Roe","given":"Jane"}],"container-title":"Journal of Obscurity","id":"ITEM-2","issued":{"date-parts":[["1965","6","1"]]},"page":"15","title":"His Anonymous Article","type":"article-journal","volume":"100"},{"author":[{"family":"Doe","given":"John"}],"container-title":"Journal of Obscurity","id":"ITEM-1","issued":{"date-parts":[["1965","6","1"]]},"page":"15","title":"His Anonymous Article","type":"article-journal","volume":"100"},{"author":[{"family":"Everhardt","given":"Ganzaheit"}],"container-title":"Journal of Obscurity","id":"ITEM-3","issued":{"date-parts":[["1965","6","1"]]},"page":"15","title":"His Anonymous Article","type":"article-journal","volume":"100"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">
        <div class="csl-left-margin">[1]</div><div class="csl-right-inline"> J. Doe, “His Anonymous Article,” <i>Journal of Obscurity</i>, vol. 100, p. 15, Jun. 1965.</div>
      </div>
      <div class="csl-entry">
        <div class="csl-left-margin">[2]</div><div class="csl-right-inline"> G. Everhardt, “His Anonymous Article,” <i>Journal of Obscurity</i>, vol. 100, p. 15, Jun. 1965.</div>
      </div>
      <div class="csl-entry">
        <div class="csl-left-margin">[3]</div><div class="csl-right-inline"> J. Roe, “His Anonymous Article,” <i>Journal of Obscurity</i>, vol. 100, p. 15, Jun. 1965.</div>
      </div>
    </div>
    """
