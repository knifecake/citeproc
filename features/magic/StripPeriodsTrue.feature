Feature: magic
  As a CSL cite processor hacker
  I want the test magic_StripPeriodsTrue to pass

  @citation @magic
  Scenario: Strip Periods True
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
        <layout suffix=".">
          <text quotes="true" suffix=", " variable="title" />
          <text strip-periods="true" variable="container-title" />
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"container-title":"Am. L.J.","id":"ITEM-1","title":"An Article","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    “An Article,” Am LJ.
    """
