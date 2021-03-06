Feature: disambiguate
  As a CSL cite processor hacker
  I want the test disambiguate_DisambiguateTrueAndYearSuffixTwo to pass

  @citation @disambiguate @citations
  Scenario: Disambiguate True And Year Suffix Two
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" demote-non-dropping-particle="sort-only" default-locale="en-GB">
      <info>
        <title>zzz</title>
        <id>http://www.zotero.org/styles/zzz</id>
        <link href="http://www.zotero.org/styles/zzz" rel="self"/>
        <author>
          <name>zzz</name>
          <email>zzz@gmail.com</email>
        </author>
        <category citation-format="author-date"/>
        <category field="humanities"/>
        <updated>2012-06-29T00:00:00+00:00</updated>
        <summary>The University College London version of Harvard author-date style</summary>
        <link href="http://www.ucl.ac.uk/art-history/current_students/writing-guide/" rel="documentation"/>
        <rights>This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/</rights>
      </info>
      <locale xml:lang="en-GB">
        <terms>
          <term name="editor" form="short">
            <single>ed.</single>
            <multiple>eds</multiple>
          </term>
        </terms>
      </locale>
      <macro name="editor">
        <names variable="editor" delimiter=", ">
          <name name-as-sort-order="all" and="text" sort-separator=", " initialize-with=". " delimiter-precedes-last="never" delimiter=", "/>
          <label form="short" prefix=" (" text-case="lowercase" suffix=".)" strip-periods="true"/>
        </names>
      </macro>
      <macro name="editor-or-author">
        <names variable="editor" delimiter=", ">
          <name name-as-sort-order="all" and="text" sort-separator=", " initialize-with=". " delimiter-precedes-last="never" delimiter=", "/>
          <label form="short" prefix=" (" text-case="lowercase" suffix=".)" strip-periods="true"/>
          <substitute>
            <names variable="author"/>
            <text macro="anon"/>
          </substitute>
        </names>
      </macro>
      <macro name="anon">
        <text term="anonymous" form="short" text-case="capitalize-first" strip-periods="true"/>
      </macro>
      <macro name="author">
        <names variable="author">
          <!-- set text-case="capitalize-first" to "uppercase" if names required  in CAPS -->
          <name name-as-sort-order="all" and="text" sort-separator=", " initialize-with=". " delimiter-precedes-last="never" delimiter=", "/>
          <label form="short" prefix=" (" suffix=".)" text-case="lowercase"/>
          <substitute>
            <names variable="editor"/>
            <text macro="anon"/>
          </substitute>
        </names>
      </macro>
      <macro name="author-short">
        <names variable="author">
          <name form="short" and="text" delimiter=", " initialize-with=". "/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
            <choose>
              <if type="bill book graphic legal_case legislation motion_picture report song" match="any">
                <text variable="title" form="short" font-style="italic"/>
              </if>
              <else>
                <text variable="title" form="short" quotes="true"/>
              </else>
            </choose>
          </substitute>
        </names>
      </macro>
      <macro name="access">
        <choose>
          <if variable="URL">
            <text term="online" prefix="[" suffix="]."/>
            <text value=" Available from: "/>
            <text variable="URL"/>
            <group prefix=" (" delimiter=" " suffix=")">
              <text term="accessed" text-case="capitalize-first"/>
              <date variable="accessed">
                <date-part name="day" suffix=" "/>
                <date-part name="month" suffix=" "/>
                <date-part name="year"/>
              </date>
            </group>
          </if>
        </choose>
      </macro>
      <macro name="title">
        <choose>
          <if type="book webpage graphic" match="any">
            <text variable="title" font-style="italic"/>
          </if>
          <else-if variable="container-title" match="none">
            <text variable="title" font-style="italic"/>
          </else-if>
          <else>
            <text variable="title"/>
          </else>
        </choose>
      </macro>
      <macro name="publisher">
        <group delimiter=", ">
          <text variable="publisher"/>
          <text variable="publisher-place"/>
    	</group>
      </macro>
      <macro name="year-date">
        <choose>
          <if variable="issued">
            <date variable="issued">
              <date-part name="year"/>
            </date>
            <text variable="year-suffix"/>
          </if>
          <else>
            <text term="no date" form="short"/>
            <text variable="year-suffix" prefix="-"/>
          </else>
        </choose>
      </macro>
      <macro name="pages">
        <group>
          <text variable="page"/>
        </group>
      </macro>
      <macro name="online">
        <choose>
          <if variable="DOI">
            <text value="[Online]"/>
          </if>
        </choose>
      </macro>
      <citation et-al-min="3" et-al-use-first="1" disambiguate-add-year-suffix="true">
        <layout>
          <group delimiter=", ">
            <text macro="author-short"/>
    		<choose>
    		   <if disambiguate="true">
    		        <text macro="year-date"/>
    		   </if>
    		</choose>
          </group>
        </layout>
      </citation>
      <bibliography hanging-indent="true" et-al-min="3" et-al-use-first="1">
        <sort>
          <key macro="author"/>
          <key variable="title"/>
        </sort>
        <layout>
          <text macro="author"/>
          <choose>
            <!-- format different types of source -->
            <if type="book" match="any">
              <group prefix=" " delimiter=", " suffix=".">
                <text macro="title"/>
                <text macro="publisher"/>
                <text macro="year-date"/>
              </group>
            </if>
            <else-if type="chapter" match="any">
              <text macro="title" prefix=" '" suffix="', "/>
              <text term="in" text-case="lowercase"/>
              <text macro="editor-or-author" prefix=" " suffix=""/>
              <group prefix=" " delimiter=", " suffix=".">
                <text variable="container-title" font-style="italic"/>
                <text macro="publisher"/>
                <text macro="year-date" prefix="" suffix="."/>
              </group>
              <label variable="page" form="short" prefix=" "/>
              <text macro="pages" suffix="."/>
            </else-if>
            <else-if type="article-journal article-newspaper broadcast personal_communication thesis webpage paper-conference" match="any">
              <text macro="title" prefix=" '" suffix="', "/>
              <text term="in" text-case="lowercase"/>
              <text macro="editor" prefix=" "/>
              <group prefix=" " delimiter=", " suffix=".">
                <text variable="container-title" font-style="italic"/>
                <text variable="volume" prefix="vol."/>
                <text variable="issue" prefix="no."/>
                <text macro="publisher"/>
                <text macro="year-date" prefix=""/>
              </group>
              <label variable="page" form="short" prefix=" "/>
              <text macro="pages" suffix="."/>
            </else-if>
            <else>
              <group prefix=" " delimiter=", " suffix=".">
                <text macro="title"/>
                <text macro="publisher"/>
                <text macro="year-date"/>
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
    [{"archive-place":"Litteleton, Colo.","author":[{"family":"Pollock","given":"Sir Frederick"}],"event-place":"Litteleton, Colo.","id":"ITEM-1","issued":{"date-parts":[[1979]]},"publisher":"Fred B. Rothman","publisher-place":"Litteleton, Colo.","title":"The land laws","type":"book"},{"archive-place":"Litteleton, Colo.","author":[{"family":"Pollock","given":"Sir Frederick"}],"event-place":"Litteleton, Colo.","id":"ITEM-2","issued":{"date-parts":[[1979]]},"publisher":"Fred B. Rothman","publisher-place":"Litteleton, Colo.","title":"The land lawsX","type":"book"}]
    """
    And I have a citations input
    When I cite all items
    Then the result should be:
    """
    >>[0] Pollock, 1979a
    >>[1] Pollock, 1979b
    """
