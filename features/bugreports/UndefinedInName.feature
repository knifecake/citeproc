Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_UndefinedInName to pass

  @bibliography @bugreports
  Scenario: Undefined In Name
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0">
      <info>
        <title>Modern Language Association</title>
        <id>http://www.zotero.org/styles/mla</id>
        <link href="http://www.zotero.org/styles/mla" rel="self"/>
        <author>
          <name>Simon Kornblith</name>
          <email>simon@simonster.com</email>
        </author>
        <contributor>
          <name> modified by Christian Werthschulte</name>
          <email>Christian.Werthschulte@rub.de</email>
        </contributor>
        <category field="generic-base"/>
        <category citation-format="author-date"/>
        <updated>2008-08-14T19:52:55+00:00</updated>
      </info>
      <macro name="editor-translator">
        <names variable="editor translator" delimiter=". ">
          <label form="verb-short" text-case="capitalize-first" suffix=". " strip-periods="true"/>
          <name and="symbol" delimiter=", "/>
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
      <macro name="author-short">
        <names variable="author">
          <name form="short" and="symbol" delimiter=", " initialize-with=". "/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
            <text macro="title-short"/>
          </substitute>
        </names>
      </macro>
      <macro name="access">
        <group delimiter=" ">
          <date variable="accessed">
            <date-part name="day" suffix=" "/>
            <date-part name="month" form="short" suffix=" "/>
            <date-part name="year"/>
          </date>
          <text variable="URL" prefix="&lt;" suffix="&gt;"/>
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
      <macro name="title-short">
        <choose>
          <if type="bill book graphic legal_case motion_picture report song" match="any">
            <text variable="title" form="short" font-style="italic"/>
          </if>
          <else>
            <text variable="title" form="short" quotes="true"/>
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
            <text variable="edition"/>
          </else>
        </choose>
      </macro>
      <macro name="publisher-year">
        <group delimiter=", ">
          <group delimiter=": ">
            <text variable="publisher-place"/>
            <text variable="publisher"/>
          </group>
          <date variable="issued">
            <date-part name="year"/>
          </date>
        </group>
      </macro>
      <citation et-al-min="4" et-al-use-first="1" disambiguate-add-names="true" disambiguate-add-givenname="true">
        <layout prefix="(" suffix=")" delimiter="; ">
          <group delimiter=" ">
            <choose>
              <if variable="author editor translator" match="any">
                <group delimiter=", ">
                  <text macro="author-short"/>
                  <choose>
                    <if disambiguate="true">
                      <text macro="title-short"/>
                    </if>
                  </choose>
                </group>
              </if>
              <else>
                <text macro="title-short"/>
              </else>
            </choose>
            <text variable="locator"/>
          </group>
        </layout>
      </citation>
      <bibliography hanging-indent="true" et-al-min="4" et-al-use-first="1" line-spacing="2" subsequent-author-substitute="---">
        <sort>
          <key macro="author"/>
          <key variable="title"/>
        </sort>
        <layout>
          <text macro="author" suffix="."/>
          <text macro="title" prefix=" " suffix="."/>
          <choose>
            <if type="bill book graphic legal_case motion_picture report song" match="any">
              <text macro="edition" prefix=" " suffix="."/>
              <text macro="editor-translator" prefix=" " suffix="."/>
              <text macro="publisher-year" prefix=" " suffix="."/>
            </if>
            <else-if type="chapter paper-conference" match="any">
              <group>
                <text variable="container-title" font-style="italic" prefix=" " suffix="."/>
                <text macro="edition" prefix=" " suffix="."/>
                <text macro="editor-translator" prefix=" " suffix="."/>
                <text macro="publisher-year" prefix=" " suffix="."/>
              </group>
              <text variable="page" prefix=" " suffix="."/>
            </else-if>
            <else>
              <group prefix=" " suffix="." delimiter=": ">
                <group delimiter=" ">
                  <text macro="editor-translator" suffix="."/>
                  <text variable="container-title" font-style="italic"/>
                  <choose>
                    <if type="article-journal">
                      <group delimiter=" ">
                        <group delimiter=".">
                          <text variable="volume"/>
                          <text variable="issue"/>
                        </group>
                        <date variable="issued" prefix="(" suffix=")">
                          <date-part name="year"/>
                        </date>
                      </group>
                    </if>
                    <else>
                      <date variable="issued">
                        <date-part name="day" suffix=" "/>
                        <date-part name="month" form="short" suffix=" "/>
                        <date-part name="year"/>
                      </date>
                    </else>
                  </choose>
                </group>
                <text variable="page"/>
              </group>
            </else>
          </choose>
          <text prefix=" " suffix="." macro="access"/>
        </layout>
      </bibliography>
    </style>

    """
    And the following input:
    """
    [{"author":[{"given":"I Test J R"}],"id":"ITEM-1","type":"book"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">I Test J R.</div>
    </div>
    """
