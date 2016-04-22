Feature: disambiguate
  As a CSL cite processor hacker
  I want the test disambiguate_InitializeWithButNoDisambiguation to pass

  @citation @disambiguate
  Scenario: Initialize With But No Disambiguation
    Given the following style:
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" version="1.0" class="in-text" demote-non-dropping-particle="sort-only" default-locale="en-GB" page-range-format="expanded">
    <info>
    <title>Imperial College School of Medicine</title>
    <link href="http://www.zotero.org/styles/style-title" rel="self"/>
    <author>
       <name></name>
      </author>
      <category citation-format="author-date"/>
      <category field="medicine"/>
    <id>http://www3.imperial.ac.uk/library/subjectsandsupport/referencemanagement/harvard/references</id>
      <updated>2011-07-19T19:50:00+01:00</updated>
      <summary>Style according to the specification for Harvard Referencing at Imperial College London</summary>
    <rights>This work is licensed under a Creative Commons
             Attribution-Share Alike 3.0 Unported License
             http://creativecommons.org/licenses/by-sa/3.0/</rights>
    </info>
    
    <macro name="editor">
        <names variable="editor" delimiter=", ">
          <name and="symbol" delimiter=", "/>
          <label form="short" prefix=" (" text-case="lowercase" suffix=".)" strip-periods="true"/>
        </names>
      </macro>
     
      <macro name="anon">
        <text term="anonymous" form="short" text-case="capitalize-first" strip-periods="true"/>
      </macro>
      
      <macro name="author">
        <names variable="author">
    <name and="symbol" name-as-sort-order="all" sort-separator=", " initialize-with="." delimiter-precedes-last="never" delimiter=", "/>
          <label form="short" prefix=" " suffix="." text-case="lowercase" strip-periods="true"/>
          <substitute>
            <text macro="editor"/>
            <text macro="anon"/>
          </substitute>
    </names>
      </macro>
      
      <macro name="author-short">
        <names variable="author">
          <name form="short" and="symbol" delimiter=", " delimiter-precedes-last="never" initialize-with="."/>
          <et-al font-style="italic"/>
    <substitute>
            <names variable="translator"/>
            <text macro="anon"/>
          </substitute>
        </names>
      </macro>
      
      <macro name="access">
        <group>
          <text value="Available from: "/>
          <text variable="DOI" prefix="doi:" suffix=""/>
          <group prefix=" [" suffix="]">
            <text term="accessed" text-case="capitalize-first" suffix=": "/>
            <date variable="accessed">
              <date-part name="day" suffix=" "/>
              <date-part name="month" suffix=" "/>
              <date-part name="year"/>
            </date>
          </group>
    </group>
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
          <text variable="publisher-place" suffix=", "/>
          <text variable="publisher" suffix="."/>
    
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
      
      <macro name="edition">
        <choose>
          <if is-numeric="edition">
            <group delimiter=" ">
              <number variable="edition" form="ordinal"/>
              <text term="edition" form="long" suffix="" text-case="lowercase" strip-periods="true"/>
            </group>
          </if>
          <else>
            <text variable="edition" suffix=""/>
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
      
      <macro name="issued">
        <choose>
          <if type="article-newspaper paper-conference broadcast" match="any">
            <date variable="issued">
              <date-part name="day" suffix=" "/>
              <date-part name="month" suffix=""/>
            </date>
          </if>
        </choose>
        <choose>
          <if type="paper-conference" match="any">
            <date variable="issued">
              <date-part name="year" prefix=" "/>
            </date>
          </if>
        </choose>
      </macro>
      
    
      <citation et-al-min="4" et-al-use-first="3" disambiguate-add-year-suffix="true" collapse="year">
        <layout prefix="(" suffix=")" delimiter="; ">
            <group delimiter=", ">
                <text macro="author-short"/>
                <text macro="year-date"/>
                <group>
                 <label variable="locator" suffix="*" form="short" strip-periods="true"/>
                  <text variable="locator"/>
                </group>
              </group>
        </layout>
      </citation>
      
      
      <bibliography hanging-indent="true" et-al-min="5" et-al-use-first="4">
        <sort>
          <key macro="author"/>
          <key variable="title"/>
        </sort>
        <layout>
           <text macro="author"/>
              <text macro="year-date" prefix=" (" suffix=")"/>
          <choose>
         
            <if type="thesis">
              <group prefix=" " delimiter=". " suffix=".">
                <text macro="title" font-style="italic"/>
                <text macro="edition"/>
                <text variable="genre"/>
                <text macro="online"/>
                <text macro="publisher"/>
              </group>
            </if>
    
            <else-if type="webpage">
              <group prefix=" " delimiter=". " suffix=".">
                <text macro="title" suffix=". "/>
                <text macro="edition"/>
                <text macro="online"/>
              </group>
              <group prefix=" " delimiter=". " suffix=".">
                <date variable="issued">
                  <date-part name="day" suffix=" "/>
                  <date-part name="month" suffix=" "/>
                  <date-part name="year"/>
                </date>
                <text variable="container-title"/>
              </group>
            </else-if>
    
            
    <else-if type="article-journal article-newspaper broadcast personal_communication thesis webpage" match="any">
              <group suffix=".">
                <text macro="title" prefix=" "/>
                <text macro="editor" prefix=" "/>
              </group>
              <choose>
                <if variable="author" match="any">
                  <text variable="container-title" font-style="italic" prefix=" " suffix="."/>
                </if>
    </choose>
              <text macro="online" prefix=" " suffix=""/>
              <group prefix=" " suffix="." delimiter="">
                <group prefix="">
                  <text variable="volume"/>
                  <text variable="issue" prefix=" (" suffix="), "/>
                  <text macro="issued"/>
                </group>
                <group prefix="">
                  <text macro="pages"/>
                </group>
              </group>
            </else-if>
    
            <else-if type="book graphic" match="any">
              <group prefix=" " delimiter=". " suffix=".">
                <text variable="note"/>
                <text macro="title"/>
                <group delimiter=" ">
                  <text variable="collection-title"/>
                  <text variable="collection-number"/>
                </group>
                <text macro="edition"/>
                <text macro="editor"/>
                <text macro="online"/>
                <text macro="publisher"/>
              </group>
            </else-if>
    
            <else-if type="chapter paper-conference" match="any">
              <text macro="title" prefix=" " suffix=". "/>
              <group prefix=" " delimiter=" ">
                <text term="in" text-case="capitalize-first" suffix=":"/>
                <text macro="editor" suffix=". "/>
                <text variable="container-title" font-style="italic" suffix="."/>
                <text variable="collection-title" suffix="."/>
    <text macro="edition" prefix=" " suffix="."/>
                <text macro="online" suffix="." prefix=""/>
                <text macro="issued"/>
                <text macro="publisher" prefix="" suffix="."/>
    <label variable="page" form="short" suffix=""/>
                  <text macro="pages" suffix="."/>
              </group>
            </else-if>
    
            <else>
              <group suffix=".">
                <text macro="title" prefix=" "/>
                <text macro="editor" prefix=" "/>
              </group>
              <text variable="container-title" font-style="italic" prefix=" " suffix="."/>
              <text macro="online" prefix=" " suffix=". "/>
              <group prefix=" " suffix=".">
                <group prefix=" ">
                  <text variable="volume"/>
                  <text variable="issue" prefix=" (" suffix=")"/>
                  <text macro="issued"/>
                </group>
                <group prefix=" ">
                  <label variable="locator" suffix="." form="short" strip-periods="true"/>
                  <text macro="pages"/>
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
    [{"author":[{"family":"Doe","given":"John"}],"id":"ITEM-1","issued":{"date-parts":[["1965"]]},"title":"His Anonymous Life","type":"book"},{"author":[{"family":"Doe","given":"Heroclitus"}],"id":"ITEM-2","issued":{"date-parts":[["1965"]]},"title":"His Anonymous Second Life","type":"chapter"}]
    """
    When I cite all items
    Then the result should be:
    """
    (Doe, 1965a, 1965b)
    """
