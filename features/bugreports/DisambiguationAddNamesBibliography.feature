Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_DisambiguationAddNamesBibliography to pass

  @bibliography @bugreports @citations
  Scenario: Disambiguation Add Names Bibliography
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0">
       <info>
          <title>Copernicus general format (dev)</title>
          <id>http://www.zotero.org/styles/copernicus</id>
          <link href="http://www.zotero.org/styles/copernicus" rel="self"/>
          <author>
             <name>Julian Onions</name>
             <email>julian.onions@gmail.com</email>
          </author>
          <contributor>
             <name> Didier Voisin </name>
          </contributor>
          <category citation-format="author-date"/>
          <category field="science"/>
          <updated>2010-07-26T02:21:30+00:00</updated>
          <summary>The Copernicus (EGU) generic style</summary>
          <link href="http://publications.copernicus.org/Copernicus_Publications_Reference_Types.pdf" rel="documentation"/>
          <rights>
    This work is licensed under a Creative Commons Attribution-Share Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/
    </rights>
       </info>
       <macro name="editor">
          <names variable="editor" delimiter=", ">
             <label form="verb" text-case="lowercase" suffix=" "/>
             <name and="text" initialize-with=". " delimiter=", "/>
          </names>
       </macro>
       <macro name="anon">
          <text term="anonymous" form="short" text-case="capitalize-first" strip-periods="true"/>
       </macro>
       <macro name="author">
          <names variable="author">
             <name sort-separator=", " initialize-with=". " name-as-sort-order="all" delimiter=", " delimiter-precedes-last="never" and="text"/>
             <label form="short" prefix=", " suffix="." text-case="capitalize-first" strip-periods="true"/>
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
                <text macro="anon"/>
             </substitute>
          </names>
       </macro>
       <macro name="access">
          <choose>
             <if variable="URL">
                <text term="online" prefix="[" suffix="]"/>
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
          <text variable="title"/>
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
             </if>
             <else>
                <text term="no date" form="short"/>
             </else>
          </choose>
       </macro>
       <macro name="published-date">
          <choose>
             <if type="article-newspaper">
                <date variable="issued">
                   <date-part name="day" form="ordinal" suffix=" "/>
                   <date-part name="month" form="long"/>
                </date>
             </if>
          </choose>
       </macro>
       <macro name="pages">
          <text variable="page"/>
       </macro>
       <macro name="refpages">
          <label variable="page" form="short" suffix=". " strip-periods="true"/>
          <text variable="page"/>
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
       <macro name="doi">
          <text variable="DOI" prefix="doi:"/>
       </macro>
       <macro name="container">
          <group delimiter=", ">
             <group delimiter=" ">
                <text term="in" text-case="lowercase"/>
                <text variable="container-title"/>
             </group>
             <group delimiter=" ">
                <text term="volume" form="short" suffix="." strip-periods="true"/>
                <text variable="volume"/>
             </group>
             <text macro="editor"/>
          </group>
       </macro>
       <citation et-al-min="3" et-al-use-first="1" et-al-subsequent-min="3" et-al-subsequent-use-first="1" disambiguate-add-year-suffix="true" collapse="year">
          <sort>
             <key macro="author"/>
             <key macro="year-date"/>
          </sort>
          <layout prefix="(" suffix=")" delimiter="; ">
             <group delimiter=", ">
                <group delimiter=", ">
                   <text macro="author-short"/>
                   <text macro="year-date"/>
                </group>
                <text variable="locator" prefix="p."/>
             </group>
          </layout>
       </citation>
       <bibliography et-al-min="11" et-al-use-first="11">
          <sort>
             <key macro="author"/>
             <key macro="year-date"/>
             <key variable="title"/>
          </sort>
          <layout>
             <group delimiter=" " suffix=":">
                <text macro="author"/>
             </group>
             <choose>
                <if type="bill book graphic legal_case motion_picture report song" match="any">
                   <group delimiter=", " prefix=" " suffix=".">
                      <text macro="title"/>
                      <text macro="edition"/>
                      <text macro="editor"/>
                      <text variable="genre"/>
                      <text macro="publisher"/>
                   </group>
                </if>
                <else-if type="chapter paper-conference" match="any">
                   <group delimiter=", " prefix=" " suffix=".">
                      <text macro="title"/>
                      <text macro="container"/>
                      <text macro="refpages"/>
                      <text macro="publisher"/>
                   </group>
                </else-if>
                <else-if type="thesis">
                   <group delimiter=", " prefix=" " suffix=".">
                      <text macro="title"/>
                      <text variable="genre"/>
                      <text variable="page" suffix=" pp."/>
                      <text macro="publisher"/>
                      <date variable="issued">
                         <date-part name="day" suffix=" "/>
                         <date-part name="month" form="long"/>
                      </date>
                   </group>
                </else-if>
                <else>
                   <group delimiter=", " suffix="," prefix=" ">
                      <text macro="title"/>
                      <text macro="editor"/>
                   </group>
                   <group prefix=" ">
                      <text variable="container-title" form="short"/>
                      <group prefix=", " delimiter=", ">
                         <group>
                            <text variable="volume"/>
                            <text variable="issue" prefix="(" suffix=")"/>
                            <text macro="published-date"/>
                         </group>
                         <text macro="pages"/>
                         <text macro="doi"/>
                      </group>
                   </group>
                </else>
             </choose>
             <text prefix=" " macro="access"/>
             <text macro="year-date" prefix=", " suffix="."/>
          </layout>
       </bibliography>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Roe","given":"Jane"},{"family":"Doe","given":"John"},{"family":"Smith","given":"John"}],"id":"ITEM-1","issued":{"date-parts":[[1995]]},"type":"book"},{"author":[{"family":"Roe","given":"Jane"},{"family":"Noakes","given":"Richard"},{"family":"Brown","given":"Bob"}],"id":"ITEM-2","issued":{"date-parts":[[1995]]},"type":"book"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">Roe, J., Doe, J. and Smith, J.:, 1995a.</div>
      <div class="csl-entry">Roe, J., Noakes, R. and Brown, B.:, 1995b.</div>
    </div>
    """
