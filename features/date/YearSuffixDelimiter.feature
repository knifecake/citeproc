Feature: date
  As a CSL cite processor hacker
  I want the test date_YearSuffixDelimiter to pass

  @citation @date
  Scenario: Year Suffix Delimiter
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
             collapse="year-suffix"
             disambiguate-add-year-suffix="true"
             year-suffix-delimiter=",">
        <layout delimiter=";">
          <group delimiter=" ">
            <names variable="author">
              <name form="short" />
            </names>
            <date variable="issued">
              <date-part name="year" />
            </date>
          </group>
          <text variable="year-suffix" />
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John","static-ordering":false}],"id":"ITEM-1","issued":{"date-parts":[["2000"]]},"title":"Paper 1","type":"book"},{"author":[{"family":"Doe","given":"John","static-ordering":false}],"id":"ITEM-2","issued":{"date-parts":[["2000"]]},"title":"Paper 2","type":"book"},{"author":[{"family":"Doe","given":"John","static-ordering":false}],"id":"ITEM-3","issued":{"date-parts":[["2001"]]},"title":"Paper 3","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Doe 2000a,b;2001
    """
