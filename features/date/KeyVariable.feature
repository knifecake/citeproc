Feature: date
  As a CSL cite processor hacker
  I want the test date_KeyVariable to pass

  @bibliography @date
  Scenario: Key Variable
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
          <text variable="title" />
        </layout>
      </citation>
      <bibliography>
        <sort>
          <key sort="descending" variable="issued" />
        </sort>
        <layout>
          <text variable="title" />
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","issued":{"date-parts":[["2000","2","15"]]},"title":"Book C","type":"book"},{"id":"ITEM-2","issued":{"date-parts":[["2000","12","15"]]},"title":"Book B","type":"book"},{"id":"ITEM-3","issued":{"date-parts":[["2001"]]},"title":"Book A","type":"book"},{"id":"ITEM-4","issued":{"date-parts":[["2000"]]},"title":"Book D","type":"book"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">Book A</div>
      <div class="csl-entry">Book B</div>
      <div class="csl-entry">Book C</div>
      <div class="csl-entry">Book D</div>
    </div>
    """
