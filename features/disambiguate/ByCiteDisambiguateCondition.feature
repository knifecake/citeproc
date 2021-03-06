Feature: disambiguate
  As a CSL cite processor hacker
  I want the test disambiguate_ByCiteDisambiguateCondition to pass

  @citation @disambiguate
  Scenario: By Cite Disambiguate Condition
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="note"
          version="1.0">
      <info>
        <id />
        <title />
        <updated>2009-08-10T04:49:00+09:00</updated>
      </info>
      <citation 
             disambiguate-add-givenname="true"
             disambiguate-add-names="true"
             disambiguate-add-year-suffix="true"
             et-al-min="2"
             et-al-use-first="1"
             givenname-disambiguation-rule="by-cite">
        <layout delimiter="; ">
          <group delimiter=", ">
            <names variable="author">
              <name and="symbol" delimiter=", " form="short" />
            </names>
            <choose>
              <if disambiguate="true">
                <text font-style="italic" variable="title" />
              </if>
            </choose>
          </group>
          <group prefix=" (" suffix=")">
            <date variable="issued">
              <date-part name="year" />
            </date>
            <text variable="year-suffix" />
          </group>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John","static-ordering":false},{"family":"Roe","given":"Jane","static-ordering":false}],"id":"ITEM-1","issued":{"date-parts":[["2000"]]},"title":"Book A","type":"book"},{"author":[{"family":"Doe","given":"John","static-ordering":false},{"family":"Roe","given":"Jane","static-ordering":false}],"id":"ITEM-2","issued":{"date-parts":[["2000"]]},"title":"Book B","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Doe et al., <i>Book A</i> (2000); Doe et al., <i>Book B</i> (2000)
    """
