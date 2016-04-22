Feature: disambiguate
  As a CSL cite processor hacker
  I want the test disambiguate_ByCiteIncremental1 to pass

  @citation @disambiguate @citations
  Scenario: By Cite Incremental1
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" demote-non-dropping-particle="sort-only" default-locale="en-US">
      <info>
        <title>Emerald journals (Harvard)</title>
        <id>http://www.zotero.org/styles/emerald-harvard</id>
        <link href="http://www.zotero.org/styles/emerald-harvard" rel="self"/>
        <link href="http://www.emeraldinsight.com/authors/guides/write/harvard.htm?part=2" rel="documentation"/>
        <author>
          <name>Sebastian Karcher</name>
        </author>
        <contributor>
          <name>Bruce D'Arcus</name>
        </contributor>
        <contributor>
          <name>Curtis M. Humphrey</name>
        </contributor>
        <contributor>
          <name>Richard Karnesky</name>
          <email>karnesky+zotero@gmail.com</email>
          <uri>http://arc.nucapt.northwestern.edu/Richard_Karnesky</uri>
        </contributor>
        <contributor>
          <name>Simon Kornblith</name>
          <email>simon@simonster.com</email>
        </contributor>
        <category citation-format="author-date"/>
        <category field="generic-base"/>
        <updated>2012-09-27T22:06:38+00:00</updated>
        <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
      </info>
      <locale>
        <style-options punctuation-in-quote="false"/>
      </locale>
      <macro name="container-contributors">
        <choose>
          <if type="chapter paper-conference" match="any">
            <text term="in" suffix=" "/>
            <names variable="editor translator" delimiter="," suffix=",">
              <name and="text" initialize-with="." delimiter=", " delimiter-precedes-last="never" name-as-sort-order="all" sort-separator=", "/>
              <label form="short" prefix=" (" text-case="capitalize-first" suffix=")"/>
            </names>
          </if>
        </choose>
      </macro>
      <macro name="secondary-contributors">
        <choose>
          <if type="chapter paper-conference" match="none">
            <names variable="editor translator" delimiter="," prefix=" (" suffix=")">
              <name and="text" initialize-with="." delimiter=", " delimiter-precedes-last="never" name-as-sort-order="all" sort-separator=", "/>
              <label form="short" prefix="," text-case="capitalize-first"/>
            </names>
          </if>
        </choose>
      </macro>
      <macro name="author">
        <names variable="author">
          <name name-as-sort-order="all" and="text" sort-separator=", " initialize-with="." delimiter=", " delimiter-precedes-last="never"/>
          <label form="short" prefix=" (" suffix=".)" text-case="capitalize-first" strip-periods="true"/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
            <text macro="title"/>
          </substitute>
        </names>
      </macro>
      <macro name="author-short">
        <names variable="author">
          <name form="short" and="text" delimiter=", " initialize-with="." delimiter-precedes-last="never"/>
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
          <if type="thesis">
            <choose>
              <if variable="archive" match="any">
                <group>
                  <text term="retrieved" text-case="capitalize-first" suffix=" "/>
                  <text term="from" suffix=" "/>
                  <text variable="archive" suffix=". "/>
                  <text variable="archive_location" prefix=" (" suffix=")"/>
                </group>
              </if>
              <else>
                <group>
                  <text term="retrieved" text-case="capitalize-first" suffix=" "/>
                  <text term="from" suffix=" "/>
                  <text variable="URL"/>
                </group>
              </else>
            </choose>
          </if>
          <else>
            <choose>
              <if variable="page" match="none">
                <choose>
                  <if variable="DOI">
                    <text variable="DOI" prefix="doi:"/>
                  </if>
                  <else>
                    <choose>
                      <if type="webpage">
                        <group>
                          <text term="retrieved" text-case="capitalize-first" suffix=" "/>
                          <date variable="accessed" suffix=", ">
                            <date-part name="month" suffix=" "/>
                            <date-part name="day" suffix=", "/>
                            <date-part name="year"/>
                          </date>
                          <group>
                            <text term="from" suffix=" "/>
                            <text variable="URL"/>
                          </group>
                        </group>
                      </if>
                      <else>
                        <group>
                          <text term="retrieved" text-case="capitalize-first" suffix=" "/>
                          <text term="from" suffix=" "/>
                          <text variable="URL"/>
                        </group>
                      </else>
                    </choose>
                  </else>
                </choose>
              </if>
            </choose>
          </else>
        </choose>
      </macro>
      <macro name="title">
        <choose>
          <if type="report thesis" match="any">
            <text variable="title" font-style="italic"/>
            <group prefix=" (" suffix=")">
              <text variable="genre"/>
              <text variable="number" prefix=" No. "/>
            </group>
          </if>
          <else-if type="bill book graphic legal_case legislation manuscript motion_picture report song speech" match="any">
            <text variable="title" font-style="italic"/>
          </else-if>
          <else>
            <text variable="title" quotes="true"/>
          </else>
        </choose>
      </macro>
      <macro name="publisher">
        <choose>
          <if type="report" match="any">
            <group delimiter=": ">
              <text variable="publisher-place"/>
              <text variable="publisher"/>
            </group>
          </if>
          <else-if type="thesis" match="any">
            <group delimiter=", ">
              <text variable="publisher"/>
              <text variable="publisher-place"/>
            </group>
          </else-if>
          <else>
            <choose>
              <if variable="event" match="none">
                <text variable="genre" suffix=", "/>
              </if>
            </choose>
            <group delimiter=", ">
              <text variable="publisher"/>
              <text variable="publisher-place"/>
            </group>
          </else>
        </choose>
      </macro>
      <macro name="event">
        <choose>
          <if variable="event">
            <choose>
              <if variable="genre" match="none">
                <text term="presented at" text-case="capitalize-first" suffix=" "/>
                <text variable="event"/>
              </if>
              <else>
                <group delimiter="">
                  <text variable="genre" text-case="capitalize-first"/>
                  <text term="presented at"/>
                  <text variable="event"/>
                </group>
              </else>
            </choose>
          </if>
        </choose>
      </macro>
      <macro name="issued">
        <choose>
          <if variable="issued">
            <group prefix=" (" suffix="),">
              <date variable="issued">
                <date-part name="year"/>
              </date>
              <choose>
                <if type="article-journal bill book chapter graphic legal_case legislation motion_picture paper-conference report song" match="none">
                  <date variable="issued">
                    <date-part prefix="," name="month"/>
                    <date-part prefix="" name="day"/>
                  </date>
                </if>
              </choose>
            </group>
          </if>
          <else>
            <text prefix=" (" term="no date" suffix=")." form="short"/>
          </else>
        </choose>
      </macro>
      <macro name="issued-year">
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
            <group delimiter="">
              <number variable="edition" form="ordinal"/>
              <text term="edition" form="short" suffix="." strip-periods="true"/>
            </group>
          </if>
          <else>
            <text variable="edition" suffix="."/>
          </else>
        </choose>
      </macro>
      <macro name="locators">
        <choose>
          <if type="article-journal article-magazine article-newspaper" match="any">
            <group delimiter=", ">
              <group>
                <text variable="volume" prefix="Vol. "/>
                <text variable="issue" prefix=" No. "/>
              </group>
              <group>
                <label variable="page" form="short" suffix=" "/>
                <text variable="page"/>
              </group>
            </group>
          </if>
          <else-if type="bill book chapter graphic legal_case legislation motion_picture paper-conference report song" match="any">
            <group prefix="" suffix="" delimiter=", ">
              <text macro="edition"/>
              <group>
                <text term="volume" form="short" plural="true" text-case="capitalize-first" suffix=". " strip-periods="true"/>
                <number variable="number-of-volumes" form="numeric" prefix="1-"/>
              </group>
              <group>
                <text term="volume" form="short" text-case="capitalize-first" suffix=". " strip-periods="true"/>
                <number variable="volume" form="numeric"/>
              </group>
              <group>
                <label variable="page" form="short" suffix=" "/>
                <text variable="page"/>
              </group>
            </group>
          </else-if>
        </choose>
      </macro>
      <macro name="citation-locator">
        <group>
          <label variable="locator" form="short"/>
          <text variable="locator" prefix=" "/>
        </group>
      </macro>
      <citation et-al-min="3" et-al-use-first="1" disambiguate-add-year-suffix="true" disambiguate-add-names="true" disambiguate-add-givenname="true" collapse="year">
        <sort>
          <key macro="author"/>
          <key macro="issued-year"/>
        </sort>
        <layout prefix="(" suffix=")" delimiter="; ">
          <group delimiter=", ">
            <text macro="author-short"/>
            <text macro="issued-year"/>
            <text macro="citation-locator"/>
          </group>
        </layout>
      </citation>
      <bibliography hanging-indent="true" et-al-min="8" et-al-use-first="7" entry-spacing="0" line-spacing="2">
        <sort>
          <key macro="author"/>
          <key macro="issued-year" sort="ascending"/>
        </sort>
        <layout>
          <group suffix=".">
            <text macro="author" suffix="."/>
            <text macro="issued" suffix=" "/>
            <group delimiter=", ">
              <text macro="title"/>
              <group>
                <text macro="container-contributors"/>
                <text macro="secondary-contributors"/>
                <group delimiter=", ">
                  <text variable="container-title" font-style="italic"/>
                  <text variable="collection-title"/>
                </group>
              </group>
            </group>
            <group delimiter=", " prefix=", ">
              <text macro="event"/>
              <text macro="publisher"/>
              <text macro="locators"/>
            </group>
          </group>
          <text macro="access" prefix=". "/>
        </layout>
      </bibliography>
    </style>

    """
    And the following input:
    """
    [{"URL":"http://www.emeraldinsight.com/journals.htm?articleid=1795171&show=abstract","accessed":{"date-parts":[["2013",1,30]],"season":"22:56:08"},"author":[{"family":"Baines","given":"T. S."},{"family":"Lightfoot","given":"H. W."},{"family":"Benedettini","given":"O."},{"family":"Kay","given":"J. M."}],"container-title":"Journal of Manufacturing Technology Management","id":"ITEM-1","issue":"5","issued":{"date-parts":[["2009"]]},"key":"T44568NT","page":"547–567","shortTitle":"The servitization of manufacturing","source":"Google Scholar","title":"The servitization of manufacturing: a review of literature and reflection on future challenges","type":"article-journal","volume":"20"},{"DOI":"10.1243/09544054JEM1552","ISSN":"0954-4054, 2041-2975","URL":"http://pib.sagepub.com/content/223/9/1207","accessed":{"date-parts":[["2013",1,30]],"season":"22:38:38"},"author":[{"family":"Baines","given":"T. S."},{"family":"Lightfoot","given":"H. W."},{"family":"Kay","given":"J. M."}],"container-title":"Proceedings of the Institution of Mechanical Engineers, Part B: Journal of Engineering Manufacture","id":"ITEM-2","issue":"9","issued":{"date-parts":[["2009",9,1]]},"journalAbbreviation":"Proceedings of the Institution of Mechanical Engineers, Part B: Journal of Engineering Manufacture","key":"BZ6F9U6V","language":"en","page":"1207-1215","shortTitle":"Servitized manufacture","source":"pib.sagepub.com","title":"Servitized manufacture: Practical challenges of delivering integrated products and services","type":"article-journal","volume":"223"},{"URL":"http://72.27.231.73/sites/phmsociety.org/files/phm_submission/2009/phmc_09_49.pdf","accessed":{"date-parts":[["2012",10,22]]},"author":[{"family":"Grubic","given":"T."},{"family":"Jennions","given":"I."},{"family":"Baines","given":"T. S."}],"id":"ITEM-3","issued":{"date-parts":[["2009"]]},"key":"3GG82XQE","source":"Google Scholar","title":"The Interaction of PSS and PHM-a mutual benefit case","type":"paper-conference"}]
    """
    And I have a citations input
    When I cite all items
    Then the result should be:
    """
    ..[0] (Baines, Lightfoot, Benedettini, et al., 2009)
    ..[1] (Baines, Lightfoot and Kay, 2009)
    >>[2] (Grubic et al., 2009)
    """
