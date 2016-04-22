Feature: disambiguate
  As a CSL cite processor hacker
  I want the test disambiguate_SkipAccessedYearSuffix to pass

  @bibliography @disambiguate
  Scenario: Skip Accessed Year Suffix
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" demote-non-dropping-particle="sort-only" default-locale="en-US">
      <info>
        <title>New Zealand Veterinary Journal</title>
        <id>http://www.zotero.org/styles/new-zealand-veterinary-journal</id>
        <link href="http://www.zotero.org/styles/new-zealand-veterinary-journal" rel="self"/>
        <link href="http://www.vetjournal.org.nz/sites/default/files/domain-19/NZVJ%20Instructions%20for%20Authors.pdf" rel="documentation"/>
        <author>
          <name>sumostorm</name>
          <email>sumostorm@gmail.com</email>
        </author>
        <category citation-format="author-date"/>
        <category field="medicine"/>
        <category field="zoology"/>
        <issn>0048-0169</issn>
        <issn>1176-0710</issn>
        <updated>2012-08-26T17:25:00+00:00</updated>
        <summary>New Zealand Veterinary Journal Style</summary>
        <rights>This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/</rights>
      </info>
      <locale xml:lang="en">
        <terms>
          <term name="edition" form="short">Edtn.</term>
          <term name="no date" form="long">date unknown</term>
        </terms>
      </locale>
      <macro name="anon">
        <text term="anonymous" form="short" text-case="capitalize-first" strip-periods="true"/>
      </macro>
      <macro name="author-bib">
        <names variable="author" suffix=". ">
          <name sort-separator=" " initialize-with="" name-as-sort-order="all" delimiter=", " font-weight="bold" delimiter-precedes-last="always"/>
          <label form="long" prefix=", " suffix="." text-case="lowercase"/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
            <text macro="anon"/>
          </substitute>
        </names>
      </macro>
      <macro name="author-cit">
        <names variable="author">
          <name form="short" and="text" delimiter=" " initialize-with=""/>
    <et-al font-style="italic" prefix=" "/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
            <text macro="anon"/>
          </substitute>
        </names>
      </macro>
      <macro name="editor">
        <names variable="editor" suffix=" ">
          <name sort-separator=" " initialize-with="" name-as-sort-order="all" delimiter=", " delimiter-precedes-last="always"/>
        <label form="short" strip-periods="true" suffix=")" prefix=" ("/>
        </names>
      </macro>
      <macro name="publisher">
    <text variable="publisher" suffix=", "/>       
     <text variable="publisher-place" suffix=", "/>     
            <text macro="date"/>
      </macro>
      <macro name="date">
        <choose>
          <if variable="issued">
            <group>
              <date variable="issued">
                <date-part name="year"/>
              </date>
              <text variable="year-suffix"/>
            </group>
          </if>
          <else>
            <group delimiter="-">
              <text term="no date"/>
              <text variable="year-suffix"/>
            </group>
          </else>
        </choose>
      </macro>
      <macro name="access">
        <choose>
          <if variable="DOI"/>
          <!--don't use if there is a DOI-->
          <else>
            <choose>
              <if variable="URL">
                <group delimiter=" " prefix=" ">
                  <group>
                    <text variable="URL"/>
                  </group>
                  <group prefix="(accessed " suffix="). " delimiter=" ">
                    <date variable="accessed" suffix="">
                      <date-part name="day" prefix=""/>
                      <date-part name="month" prefix=" " suffix=" " form="long" strip-periods="true"/>
                      <date-part name="year"/>
                    </date>
                  </group>
                </group>
              </if>
            </choose>
          </else>
        </choose>
      </macro>
      <macro name="title">
        <choose>
          <if variable="DOI">
            <text variable="title"/>
          </if>
          <else>
            <group delimiter=" ">
              <choose>
                <if type="bill book graphic legal_case legislation motion_picture report song" match="any">
                  <choose>
                    <if variable="URL">
                      <text variable="title"/>
                    </if>
                    <else>
                      <text variable="title" font-style="italic"/>
                    </else>
                  </choose>
                </if>
                <else>
                  <text variable="title"/>
                </else>
              </choose>
            </group>
          </else>
        </choose>
      </macro>
      <macro name="edition">
        <choose>
          <if is-numeric="edition">
            <group delimiter=" ">
              <number variable="edition" form="ordinal"/>
              <text term="edition" form="short" suffix="" strip-periods="true"/>
            </group>
          </if>
          <else>
            <text variable="edition" suffix="."/>
          </else>
        </choose>
      </macro>
      <!--   formatting citation      -->
      <citation et-al-min="3" et-al-use-first="1" disambiguate-add-year-suffix="true" collapse="year">
        <sort>
          <key macro="date"/>
          <key macro="author-bib"/>
        </sort>
        <layout prefix="(" suffix=")" delimiter="; ">
          <group delimiter=" ">
            <group delimiter=", ">
              <text macro="author-cit"/>
              <text macro="date"/>
            </group>
            <!-- <text variable="locator" prefix="p."/> -->
          </group>
        </layout>
      </citation>
      <!--   formatting bibliography      -->
      <bibliography>
        <sort>
          <key macro="author-bib"/>
          <key macro="date"/>
        </sort>
        <layout suffix="">
          <text macro="author-bib"/>
          <text macro="title" suffix=". "/>
          <choose>
            <if type="bill book graphic legal_case legislation motion_picture report song" match="any">
              <group delimiter=" " suffix="">
                <text macro="edition" suffix="."/>
                <text macro="access"/>
                <text macro="publisher"/>
              </group>
            </if>
            <else-if type="chapter paper-conference" match="any">
              <group delimiter=". ">
                <group>
                  <text term="in" suffix=": " text-case="capitalize-first"/>
                   <text macro="editor" suffix =". "/>               
                  <text variable="container-title" suffix="" font-style="italic"/>
                </group>     
              </group>
    <text macro="edition" prefix=". "/>
              <text variable="page" prefix=". Pp " suffix=". "/>
     	    <text variable="event"/>
    <text macro="access" suffix=" "/>
            <group delimiter=", " prefix="" suffix=", ">    
    	<text variable="publisher"/>
    	    <text variable="publisher-place"/>
    	</group>       
    <group delimiter=", " prefix="" suffix="">    
    	<text macro="date"/>
    	</group>
            </else-if>
            <else-if type="article-journal">
              <choose>
                <if variable="issue volume" match="any">
                  <text variable="container-title" suffix=" " form="short" font-style="italic"/>
                  <text variable="volume"/>
                  <text variable="page" prefix=", " suffix=""/>
                  <text macro="date" prefix=", " suffix=""/>
                </if>
                <else>
                  <choose>
                    <if variable="DOI">
                      <text variable="container-title" suffix=" " form="short" font-style="italic"/>
                      <group prefix="(" suffix=").">
                        <date variable="issued">
                          <date-part name="month" prefix=" " suffix=" "/>
                          <date-part name="day" prefix="" suffix=", "/>
                          <date-part name="year"/>
                        </date>
                      </group>
                      <text variable="DOI" prefix=" doi: "/>
                    </if>
                    <else>
                      <text variable="container-title" suffix=". " form="short" font-style="italic"/>
                    </else>
                  </choose>
                </else>
              </choose>
            </else-if>
            <else>
              <text variable="container-title" suffix=". " form="short" font-style="italic"/>
              <text variable="volume"/>
               <text macro="access"/>
              <text variable="publisher" suffix=". "/>
              <text variable="page" prefix=": " suffix=", "/>
              <text macro="date" prefix="" suffix=""/>
            </else>
          </choose>
        </layout>
      </bibliography>
    </style>

    """
    And the following input:
    """
    [{"URL":"http://example.com","accessed":{"date-parts":[["2000","12","15"]]},"author":[{"family":"Doe","given":"John"}],"id":"ITEM-1","issued":{"date-parts":[["1965","6","1"]]},"title":"His Anonymous Life","type":"book"},{"URL":"http://example.com","accessed":{"date-parts":[["2000","12","15"]]},"author":[{"family":"Doe","given":"John"}],"id":"ITEM-2","issued":{"date-parts":[["1965","6","1"]]},"title":"His Anonymous Life","type":"book"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry"><b>Doe J</b>. His Anonymous Life. http://example.com (accessed 15 December 2000). 1965a</div>
      <div class="csl-entry"><b>Doe J</b>. His Anonymous Life. http://example.com (accessed 15 December 2000). 1965b</div>
    </div>
    """
