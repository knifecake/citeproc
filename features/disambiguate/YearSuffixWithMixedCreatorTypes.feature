Feature: disambiguate
  As a CSL cite processor hacker
  I want the test disambiguate_YearSuffixWithMixedCreatorTypes to pass

  @citation @disambiguate @citation-items
  Scenario: Year Suffix With Mixed Creator Types
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
             disambiguate-add-year-suffix="true">
        <layout prefix="(" suffix=")">
          <group delimiter=" ">
            <names variable="author">
              <name form="short"/>
              <substitute>
                <names variable="editor"/>
              </substitute>
            </names>
            <date form="text" date-parts="year" variable="issued" />
          </group>
        </layout>
      </citation>
      <bibliography>
        <sort>
          <key variable="issued" />
          <key variable="title" />
        </sort>
        <layout>
          <text value="Ignore me" />
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Asthma","given":"Albert","static-ordering":false}],"id":"ITEM-1","issued":{"date-parts":[["1990"]]},"title":"Book A","type":"book"},{"editor":[{"family":"Asthma","given":"Albert","static-ordering":false}],"id":"ITEM-2","issued":{"date-parts":[["1990"]]},"title":"Book B","type":"book"}]
    """
    When I cite the following items:
    """
    [[{"id":"ITEM-1"}],[{"id":"ITEM-2"}]]
    """
    Then the results should be:
      | (Asthma 1990a) |
      | (Asthma 1990b) |
