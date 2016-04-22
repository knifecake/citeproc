Feature: condition
  As a CSL cite processor hacker
  I want the test condition_NameAndTextVars to pass

  @citation @condition @citations
  Scenario: Name And Text Vars
    Given the following style:
    """
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" demote-non-dropping-particle="sort-only">
      <info>
        <title>Chicago Manual of Style (author-date) [test match]</title>
        <id>http://www.zotero.org/styles/chicago-author-date-test-match</id>
        <link href="http://www.zotero.org/styles/chicago-author-date" rel="self"/>
        <link href="http://www.chicagomanualofstyle.org/tools_citationguide.html" rel="documentation"/>
        <author>
          <name>Julian Onions</name>
          <email>julian.onions@gmail.com</email>
        </author>
        <contributor>
          <name>Sebastian Karcher</name>
        </contributor>
        <contributor>
          <name>Richard Karnesky</name>
          <email>karnesky+zotero@gmail.com</email>
          <uri>http://arc.nucapt.northwestern.edu/Richard_Karnesky</uri>
        </contributor>
        <category citation-format="author-date"/>
        <category field="generic-base"/>
        <summary>The author-date variant of the Chicago style</summary>
        <updated>2013-03-28T05:37:10+00:00</updated>
        <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
      </info>
      <citation>
    <layout>
    <choose>
    <if variable="author note" match="all">
    <text value="should not be this"/>
    </if>
    <else>
    <text value="should be this!"/>
    </else>
    </choose>
    </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"URL":"http://legal-dictionary.thefreedictionary.com/","accessed":{"date-parts":[["2012",4,15]]},"author":[{"family":"Harvey","given":"Slurp"}],"id":87,"key":"178050_B4IMW86H","title":"Legal Dictionary","type":"webpage"}]
    """
    And I have a citations input
    When I cite all items
    Then the result should be:
    """
    >>[0] should be this!
    """
