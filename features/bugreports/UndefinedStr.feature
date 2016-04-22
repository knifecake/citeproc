Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_UndefinedStr to pass

  @bibliography @bugreports
  Scenario: Undefined Str
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0">
      <info>
        <title>Acta Materialia</title>
        <id>http://www.zotero.org/styles/acta-materialia</id>
        <link href="http://www.zotero.org/styles/acta-materialia" rel="self"/>
        <author>
          <name>Richard Karnesky</name>
          <email>karnesky+zotero@gmail.com</email>
          <uri>http://arc.nucapt.northwestern.edu/Richard_Karnesky</uri>
        </author>
        <category field="engineering"/>
        <!--<category term="materials science"/>-->
        <category field="generic-base"/>
        <category citation-format="numeric"/>
        <updated>2010-04-24T04:49:00+09:00</updated>
        <summary>A style for Elsevier's journal "Acta Materialia"</summary>
        <issn>1359-6454</issn>
        <link href="http://www.elsevier.com/wps/find/journaldescription.cws_home/221/authorinstructions#Refs" rel="documentation"/>
        <rights>This work is licensed under a Creative Commons Attribution-Share Alike 3.0 United States License: http://creativecommons.org/licenses/by-sa/3.0/us/</rights>
      </info>
      <macro name="author">
        <names variable="author">
          <name initialize-with="" delimiter=", " delimiter-precedes-last="always" name-as-sort-order="all" sort-separator=" "/>
          <label form="long" prefix=", " text-case="lowercase" suffix="."/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
          </substitute>
        </names>
      </macro>
      <macro name="editor">
        <names variable="editor">
          <name initialize-with="" delimiter=", " delimiter-precedes-last="always" name-as-sort-order="all" sort-separator=" "/>
          <label form="long" prefix=", " text-case="lowercase" suffix="."/>
        </names>
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
      <macro name="publisher">
        <text variable="publisher-place" suffix=": " text-case="title"/>
        <text variable="publisher" suffix=", "/>
        <text macro="year-date"/>
      </macro>
      <citation collapse="citation-number">
        <sort>
          <key variable="citation-number"/>
        </sort>
        <layout prefix="[" suffix="]" delimiter=",">
          <text variable="citation-number"/>
        </layout>
      </citation>
      <bibliography entry-spacing="0" second-field-align="flush">
        <layout suffix=".">
          <text variable="citation-number" prefix="[" suffix="]"/>
          <text macro="author" prefix=" " suffix=". "/>
          <choose>
            <if type="bill book graphic legal_case motion_picture report song" match="any">
              <group delimiter=". ">
                <group delimiter=", ">
                  <text variable="title" text-case="title"/>
                  <text variable="volume" prefix="vol. "/>
                </group>
                <text macro="publisher"/>
              </group>
            </if>
            <else-if type="chapter paper-conference" match="any">
              <group delimiter=". ">
                <text variable="title" text-case="sentence"/>
                <text term="in" text-case="sentence" suffix=":"/>
                <text macro="editor"/>
                <group delimiter=", ">
                  <text variable="container-title" form="short" text-case="title"/>
                  <text variable="volume" prefix="vol. "/>
                </group>
                <text macro="publisher"/>
                <group delimiter=" ">
                  <label variable="page" form="short" suffix="." strip-periods="true"/>
                  <text variable="page"/>
                </group>
              </group>
            </else-if>
            <else-if type="patent">
              <group delimiter=", ">
                <group delimiter=". ">
                  <text variable="title" text-case="title"/>
                  <text variable="number" prefix="U.S. Patent "/>
                </group>
                <text macro="year-date"/>
              </group>
            </else-if>
            <else-if type="thesis">
              <group delimiter=". ">
                <text variable="title" text-case="title"/>
                <text variable="genre"/>
                <group delimiter=", ">
                  <text variable="publisher"/>
                  <text macro="year-date"/>
                </group>
              </group>
            </else-if>
            <else>
              <group delimiter=":">
                <group delimiter=" ">
                  <text variable="container-title" form="short" text-case="sentence"/>
                  <group delimiter=";">
                    <text macro="year-date"/>
                    <text variable="volume"/>
                  </group>
                </group>
                <!-- TODO: Change to page-first when Zotero supports it -->
                <text variable="page" form="short"/>
              </group>
            </else>
          </choose>
        </layout>
      </bibliography>
    </style>

    """
    And the following input:
    """
    [{"author":[{"family":"FamilyName","given":"GivenName"}],"id":"ITEM-1","title":"The Title","type":"article-journal"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">
        <div class="csl-left-margin">[1]</div><div class="csl-right-inline"> FamilyName G. n.d.</div>
      </div>
    </div>
    """
