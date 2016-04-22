Feature: sort
  As a CSL cite processor hacker
  I want the test sort_DateVariableRangeMixed to pass

  @citation @sort
  Scenario: Date Variable Range Mixed
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
        <sort>
          <key variable="issued" sort="ascending"/>
        </sort>
        <layout delimiter="; ">
          <text variable="title" />
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","issued":{"date-parts":[["2000","5"],["2001","5"]]},"title":"Book A","type":"book"},{"id":"ITEM-2","issued":{"date-parts":[["2000","5"]]},"title":"Book B","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Book B; Book A
    """
