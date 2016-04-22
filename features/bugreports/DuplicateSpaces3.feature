Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_DuplicateSpaces3 to pass

  @bibliography @bugreports
  Scenario: Duplicate Spaces3
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0">
      <info>
        <title>American Medical Association</title>
        <id>http://www.zotero.org/styles/ama</id>
        <link href="http://www.zotero.org/styles/ama" rel="self"/>
        <author>
          <name>Julian Onions</name>
          <email>julian.onions@gmail.com</email>
        </author>
        <category citation-format="numeric"/>
        <category field="medicine"/>
        <updated>2008-03-08T20:38:52+00:00</updated>
        <summary>The American Medical Association style as used in JAMA.</summary>
        <link href="http://www.samford.edu/schools/pharmacy/dic/amaquickref07.pdf" rel="documentation"/>
      </info>
      <macro name="editor">
        <names variable="editor">
          <name name-as-sort-order="all" sort-separator=" " initialize-with="" delimiter=", " delimiter-precedes-last="always"/>
          <label form="short" prefix=", " text-case="lowercase" suffix="." strip-periods="true"/>
        </names>
      </macro>
      <macro name="anon">
        <text term="anonymous" form="short" text-case="capitalize-first" strip-periods="true"/>
      </macro>
      <macro name="author">
        <group suffix=".">
          <names variable="author">
            <name name-as-sort-order="all" sort-separator=" " initialize-with="" delimiter=", " delimiter-precedes-last="always"/>
            <label form="short" prefix=" " suffix="" text-case="lowercase" strip-periods="true"/>
            <substitute>
              <names variable="editor"/>
              <text macro="anon"/>
            </substitute>
          </names>
        </group>
      </macro>
      <macro name="author-short">
        <names variable="author">
          <name form="short" and="symbol" delimiter=", " initialize-with="."/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
            <text macro="anon"/>
          </substitute>
        </names>
      </macro>
      <macro name="access">
        <group>
          <text value="Available at:" suffix=" "/>
          <text variable="URL"/>
          <group prefix=" [" suffix="]">
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
          <if type="bill book graphic legal_case motion_picture report song" match="any">
            <text variable="title" font-style="italic"/>
          </if>
          <else>
            <text variable="title"/>
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
        <group prefix=" ">
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
        </group>
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
      <citation collapse="citation-number">
        <sort>
          <key variable="citation-number"/>
        </sort>
        <layout delimiter="," vertical-align="sup">
          <text variable="citation-number"/>
          <group prefix="(" suffix=")">
            <label variable="locator" form="short" strip-periods="true"/>
            <text variable="locator"/>
          </group>
        </layout>
      </citation>
      <bibliography hanging-indent="false" et-al-min="6" et-al-use-first="3">
        <layout>
          <text variable="citation-number" prefix="" suffix=". "/>
          <text macro="author" suffix=""/>
          <choose>
            <if type="bill book graphic legal_case motion_picture report song" match="any">
              <group suffix=".">
                <text macro="title" prefix=" " suffix="."/>
                <text macro="edition" prefix=" "/>
                <text macro="editor" prefix=" (" suffix=")"/>
              </group>
              <text prefix=" " suffix="" macro="publisher"/>
              <group suffix="." prefix="; ">
                <date variable="issued">
                  <date-part name="year"/>
                </date>
                <text variable="page" prefix=":"/>
              </group>
            </if>
            <else-if type="chapter paper-conference" match="any">
              <text macro="title" prefix=" " suffix="."/>
              <group prefix=" ">
                <text term="in" text-case="capitalize-first" suffix=": "/>
                <text macro="editor"/>
                <text variable="container-title" font-style="italic" prefix=" " suffix="."/>
                <text variable="volume" prefix="Vol " suffix="."/>
                <text macro="edition" prefix=" "/>
                <text variable="collection-title" prefix=" " suffix="."/>
                <group suffix=".">
                  <text macro="publisher" prefix=" "/>
                  <group suffix="." prefix="; ">
                    <date variable="issued">
                      <date-part name="year"/>
                    </date>
                    <text variable="page" prefix=":"/>
                  </group>
                </group>
              </group>
            </else-if>
            <else>
              <group suffix=".">
                <text macro="title" prefix=" "/>
                <text macro="editor" prefix=" "/>
              </group>
              <group prefix=" " suffix=".">
                <text variable="container-title" font-style="italic" form="short" suffix="."/>
                <group delimiter=";" prefix=" ">
                  <date variable="issued">
                    <date-part name="year"/>
                  </date>
                  <group>
                    <text variable="volume"/>
                    <text variable="issue" prefix="(" suffix=")"/>
                  </group>
                </group>
                <text variable="page" prefix=":"/>
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
    [{"author":[{"family":"Family Name","given":"N"}],"container-title":"Container Title","id":"ITEM-1","title":"The Title","type":"chapter"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">1. Family Name N. The Title. In: <i>Container Title</i>.</div>
    </div>
    """
