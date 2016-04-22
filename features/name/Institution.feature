Feature: name
  As a CSL cite processor hacker
  I want the test name_Institution to pass

  @citation @name
  Scenario: Institution
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
      <citation>
        <layout>
          <names variable="author">
            <name />
          </names>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"literal":"Multi-National United"}],"id":"institution-name-1","issued":{"date-parts":[["2006"]]},"title":"White Paper on Education, Sports, Culture, Science and Technology","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Multi-National United
    """
