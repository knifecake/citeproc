Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_SingleQuote to pass

  @bibliography @bugreports
  Scenario: Single Quote
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0">
       <info>
          <title>IEEE</title>
          <id>http://www.zotero.org/styles/ieee</id>
          <link href="http://www.zotero.org/styles/ieee" rel="self"/>
          <author>
             <name>Michael Berkowitz</name>
             <email>mberkowi@gmu.edu</email>
          </author>
          <contributor>
             <name>Julian Onions</name>
             <email>julian.onions@gmail.com</email>
          </contributor>
          <contributor>
             <name>Rintze Zelle</name>
             <uri>http://forums.zotero.org/account/831/</uri>
          </contributor>
          <category field="engineering"/>
          <category field="generic-base"/>
          <category citation-format="numeric"/>
          <updated>2010-02-06T06:35:40+00:00</updated>
          <link href="http://www.ieee.org/portal/cms_docs_iportals/iportals/publications/authors/transjnl/stylemanual.pdf" rel="documentation"/>
       </info>
       <macro name="author">
          <names variable="author">
             <name initialize-with="." delimiter=", " and="text"/>
             <label form="short" prefix=", " text-case="capitalize-first" suffix="." strip-periods="true"/>
             <substitute>
                <names variable="editor"/>
                <names variable="translator"/>
             </substitute>
          </names>
       </macro>
       <macro name="editor">
          <names variable="editor">
             <name initialize-with="." delimiter=", " and="text" name-as-sort-order="all"/>
             <label form="short" prefix=", " text-case="capitalize-first" suffix="." strip-periods="true"/>
          </names>
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
          <text variable="publisher-place" suffix=": " prefix=" "/>
          <text variable="publisher" suffix=", "/>
          <date variable="issued">
             <date-part name="year"/>
          </date>
       </macro>
       <macro name="access">
          <text variable="URL"/>
       </macro>
       <macro name="page">
          <group>
             <label variable="page" form="short" suffix=". " strip-periods="true"/>
             <text variable="page"/>
          </group>
       </macro>
       <citation et-al-min="3" et-al-use-first="1" collapse="citation-number">
          <sort>
             <key variable="citation-number"/>
          </sort>
          <layout delimiter=",">
             <text variable="citation-number" prefix="[" suffix="]"/>
          </layout>
       </citation>
       <bibliography entry-spacing="0" second-field-align="flush">
          <layout suffix=".">
             <text variable="citation-number" prefix="[" suffix="]"/>
             <text macro="author" prefix=" " suffix=", "/>
             <choose>
                <if type="bill book graphic legal_case motion_picture report song" match="any">
                   <group delimiter=", ">
                      <text macro="title"/>
                      <text macro="publisher"/>
                   </group>
                </if>
                <else-if type="chapter paper-conference" match="any">
                   <group delimiter=", ">
                      <text macro="title"/>
                      <text variable="container-title" font-style="italic"/>
                      <text macro="editor"/>
                      <text macro="publisher"/>
                      <text macro="page"/>
                   </group>
                </else-if>
                <else-if type="patent">
                   <text macro="title" suffix=", "/>
                   <text variable="number" prefix="U.S. Patent "/>
                   <date variable="issued" prefix=", ">
                      <date-part name="month" suffix=" "/>
                      <date-part name="day" suffix=", "/>
                      <date-part name="year"/>
                   </date>
                </else-if>
                <else-if type="thesis">
                   <group delimiter=", ">
                      <text macro="title"/>
                      <text variable="genre"/>
                      <text variable="publisher"/>
                      <date variable="issued">
                         <date-part name="year"/>
                      </date>
                   </group>
                </else-if>
                <else>
                   <group delimiter=", ">
                      <text macro="title"/>
                      <text variable="container-title" font-style="italic"/>
                      <text variable="volume" prefix=" vol. "/>
                      <date variable="issued">
                         <date-part name="month" form="short" suffix=". " strip-periods="true"/>
                         <date-part name="year"/>
                      </date>
                      <text macro="page"/>
                   </group>
                </else>
             </choose>
          </layout>
       </bibliography>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","title":"production d ' eau glacée à condensation à eau avec récupération de chaleur . Modélisation simplifiée dans l ’ optique d ’ un calcul des consommations d ’ énergie d ’ une insta"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">
        <div class="csl-left-margin">[1]</div><div class="csl-right-inline">“production d ’ eau glacée à condensation à eau avec récupération de chaleur . Modélisation simplifiée dans l ’ optique d ’ un calcul des consommations d ’ énergie d ’ une insta.”</div>
      </div>
    </div>
    """
