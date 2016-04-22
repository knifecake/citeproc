Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_parenthesis to pass

  @bibliography @bugreports
  Scenario: parenthesis
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="note" version="1.0">
      <info>
        <title>Modern Humanities Research Association (Note with Bibliography)</title>
        <id>http://www.zotero.org/styles/mhra</id>
        <link href="http://www.zotero.org/styles/mhra" rel="self"/>
        <link href="http://www.mhra.org.uk/Publications/Books/StyleGuide/download.shtml" rel="documentation"/>
        <author>
          <name>Julian Onions</name>
          <email>julian.onions@gmail.com</email>
        </author>
        <category field="history"/>
        <category citation-format="numeric"/>
        <category field="generic-base"/>
        <updated>2008-02-02T00:00:00+00:00</updated>
      </info>
      <macro name="editor-translator">
        <names variable="editor translator" prefix="" suffix="" delimiter=", ">
          <label form="verb-short" prefix=" " text-case="lowercase" suffix=" " strip-periods="true"/>
          <name and="text" delimiter=", "/>
        </names>
      </macro>
      <macro name="editor-translator-short">
        <names variable="editor translator" prefix="" suffix="" delimiter=", ">
          <label form="short" prefix=" " text-case="lowercase" suffix=". " strip-periods="true"/>
          <name and="text" delimiter=", "/>
        </names>
      </macro>
      <macro name="author">
        <names variable="author">
          <name name-as-sort-order="first" and="text" sort-separator=", " delimiter=", " delimiter-precedes-last="always"/>
          <label form="short" prefix=", " suffix="." strip-periods="true"/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
            <text macro="title"/>
          </substitute>
        </names>
      </macro>
      <macro name="author-full">
        <names variable="author">
          <name name-as-sort-order="all" and="text" sort-separator=", " delimiter=", " delimiter-precedes-last="always"/>
          <label form="short" prefix=", " suffix="." strip-periods="true"/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
            <text macro="title"/>
          </substitute>
        </names>
      </macro>
      <macro name="author-short">
        <names variable="author">
          <name form="long" and="text" delimiter=", "/>
          <label form="short" prefix=", " suffix="." strip-periods="true"/>
        </names>
      </macro>
      <macro name="access">
        <group>
          <text variable="URL"/>
          <group prefix=" (" suffix=")" delimiter=" ">
            <text term="accessed" text-case="lowercase" suffix=" "/>
            <date variable="accessed" suffix=", ">
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
            <text variable="title" form="long" quotes="true"/>
          </if>
          <else-if type="bill book graphic legal_case motion_picture report song" match="any">
            <text variable="title" form="long" font-style="italic"/>
          </else-if>
          <else>
            <text variable="title" form="long" quotes="true"/>
          </else>
        </choose>
      </macro>
      <macro name="publisher">
        <group delimiter=": ">
          <text variable="publisher-place"/>
          <text variable="publisher"/>
        </group>
      </macro>
      <macro name="pages">
        <choose>
          <if type="article-journal" match="none">
            <label variable="page" form="short" suffix=". " strip-periods="true"/>
          </if>
        </choose>
        <text variable="page"/>
      </macro>
      <macro name="locator">
        <label variable="locator" form="short" suffix=". " strip-periods="true"/>
        <text variable="locator"/>
      </macro>
      <macro name="vols">
        <choose>
          <if variable="number-of-volumes">
            <text variable="number-of-volumes"/>
            <text term="volume" prefix=" " form="short" plural="true" strip-periods="true"/>
          </if>
        </choose>
      </macro>
      <citation>
        <layout suffix="." delimiter="; ">
          <group suffix="">
            <text macro="author-short" suffix=", "/>
            <text macro="title" prefix=""/>
            <choose>
              <if type="thesis">
                <group prefix=" (" delimiter=", " suffix=")">
                  <text variable="genre"/>
                  <text variable="publisher"/>
                  <date variable="issued">
                    <date-part name="year"/>
                  </date>
                </group>
              </if>
              <else-if type="chapter paper-conference" match="any">
                <group prefix=", ">
                  <text term="in" text-case="lowercase"/>
                  <text variable="container-title" font-style="italic" prefix=" " suffix=","/>
                  <text variable="collection-title" prefix=" " suffix=","/>
                  <text macro="editor-translator-short"/>
                </group>
                <group prefix=" (" suffix=")" delimiter=", ">
                  <text macro="publisher"/>
                  <date variable="issued">
                    <date-part name="year"/>
                  </date>
                </group>
              </else-if>
              <else-if type="bill book graphic legal_case motion_picture report song" match="any">
                <group delimiter=", " prefix=" ">
                  <text macro="editor-translator-short"/>
                  <text variable="collection-title"/>
                  <text variable="edition" suffix=" edn"/>
                  <text macro="vols"/>
                </group>
                <group prefix=" (" suffix=")" delimiter=", ">
                  <text macro="publisher"/>
                  <date variable="issued" prefix=" " suffix="">
                    <date-part name="year"/>
                  </date>
                </group>
                <text variable="volume" prefix=", "/>
              </else-if>
              <else-if type="article-newspaper article-magazine" match="any">
                <group delimiter=", " prefix=", ">
                  <text variable="container-title" font-style="italic"/>
                  <text variable="issue" suffix="."/>
                  <date variable="issued">
                    <date-part name="day" form="numeric" suffix=" "/>
                    <date-part name="month" form="long" suffix=" "/>
                    <date-part name="year"/>
                  </date>
                </group>
              </else-if>
              <else-if type="article-journal">
                <group prefix=", " delimiter=", ">
                  <text variable="container-title" font-style="italic"/>
                  <text macro="publisher"/>
                  <text variable="volume" prefix=" "/>
                </group>
                <date variable="issued" prefix=" (" suffix=")">
                  <date-part name="year"/>
                </date>
              </else-if>
              <else>
                <group delimiter=", " prefix=". ">
                  <text variable="container-title" font-style="italic"/>
                  <text variable="issue" prefix=", " suffix="."/>
                  <date variable="issued">
                    <date-part name="month" form="long"/>
                    <date-part name="day" form="numeric" prefix=" " suffix=", "/>
                    <date-part name="year"/>
                  </date>
                </group>
              </else>
            </choose>
            <group prefix=", " delimiter=" ">
              <text macro="pages"/>
              <text macro="locator" prefix="(" suffix=")"/>
            </group>
          </group>
        </layout>
      </citation>
      <bibliography hanging-indent="true" et-al-min="6" et-al-use-first="6" subsequent-author-substitute="---">
        <sort>
          <key macro="author"/>
          <key variable="title"/>
        </sort>
        <layout suffix=".">
          <text macro="author" suffix=","/>
          <choose>
            <if type="thesis">
              <group suffix=".">
                <text macro="title" prefix=" "/>
              </group>
              <group delimiter=", " prefix=" ">
                <text variable="genre"/>
                <text variable="publisher"/>
                <date variable="issued">
                  <date-part name="year"/>
                </date>
              </group>
            </if>
            <else-if type="chapter paper-conference" match="any">
              <text macro="title" prefix=" "/>
              <group prefix=", ">
                <text term="in" text-case="lowercase"/>
                <text variable="container-title" font-style="italic" prefix=" " suffix=","/>
                <text variable="collection-title" prefix=" " suffix=","/>
                <text macro="editor-translator-short"/>
              </group>
              <group prefix=" (" suffix=")" delimiter=", ">
                <text macro="publisher"/>
                <date variable="issued">
                  <date-part name="year"/>
                </date>
              </group>
            </else-if>
            <else-if type="article-journal">
              <group suffix=".">
                <text macro="title" prefix=" "/>
                <text macro="editor-translator" prefix=" "/>
              </group>
              <group prefix=" " suffix="">
                <text variable="container-title" font-style="italic" prefix=" "/>
                <text variable="volume" prefix=" "/>
                <text variable="issue" prefix=", no. "/>
                <date variable="issued" prefix=" (" suffix=")">
                  <date-part name="month" suffix=" "/>
                  <date-part name="day" suffix=", "/>
                  <date-part name="year"/>
                </date>
                <text variable="page" prefix=": "/>
              </group>
            </else-if>
            <else-if type="article-newspaper article-magazine" match="any">
              <group suffix=".">
                <text macro="title" prefix=" "/>
                <text macro="editor-translator" prefix=" "/>
              </group>
              <group delimiter=", " prefix=" ">
                <text variable="container-title" font-style="italic"/>
                <text variable="issue" suffix="."/>
                <date variable="issued">
                  <date-part name="month" form="long"/>
                  <date-part name="day" form="numeric" prefix=" " suffix=", "/>
                  <date-part name="year"/>
                </date>
              </group>
            </else-if>
            <else-if type="paper-conference">
              <group suffix=".">
                <text macro="title" prefix=" "/>
                <text macro="editor-translator" prefix=" "/>
              </group>
              <group suffix="">
                <text value="paper presented at" text-case="capitalize-first"/>
                <text variable="event" prefix=" "/>
                <text variable="event-place" prefix=", "/>
                <date variable="event-date">
                  <date-part name="month" form="long"/>
                  <date-part name="day" form="numeric" prefix=" " suffix=", "/>
                  <date-part name="year"/>
                </date>
              </group>
            </else-if>
            <else-if type="bill book graphic legal_case motion_picture report song" match="any">
              <group suffix=".">
                <text macro="title" prefix=" " suffix="."/>
              </group>
              <group delimiter=", " prefix=" ">
                <text macro="editor-translator-short"/>
                <text variable="collection-title"/>
                <text variable="edition" suffix=" edn"/>
                <text macro="vols"/>
              </group>
              <group prefix=" (" suffix=")" delimiter=", ">
                <text macro="publisher"/>
                <date variable="issued" prefix=" " suffix="">
                  <date-part name="year"/>
                </date>
              </group>
              <text variable="volume" prefix=", "/>
            </else-if>
            <else>
              <group suffix=".">
                <text macro="title" prefix=" "/>
                <text macro="editor-translator" prefix=" "/>
              </group>
              <group prefix=" " suffix="">
                <text variable="container-title" font-style="italic"/>
                <group prefix=", ">
                  <text variable="volume" font-style="italic"/>
                  <text variable="issue" prefix="(" suffix=")"/>
                </group>
                <text variable="page" prefix=", "/>
              </group>
            </else>
          </choose>
          <text prefix=" " macro="access"/>
        </layout>
      </bibliography>
    </style>

    """
    And the following input:
    """
    [{"id":"ITEM-1","issued":{"date-parts":[[2006]]},"page":"1-7","type":"article-journal"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry"> (2006): 1–7.</div>
    </div>
    """
