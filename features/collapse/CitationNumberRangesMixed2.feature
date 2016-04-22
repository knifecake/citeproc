Feature: collapse
  As a CSL cite processor hacker
  I want the test collapse_CitationNumberRangesMixed2 to pass

  @citation @collapse @citation-items
  Scenario: Citation Number Ranges Mixed2
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
             collapse="citation-number">
        <sort>
          <key variable="citation-number" />
        </sort>
        <layout delimiter=", " prefix="(" suffix=")">
          <text prefix="[" suffix="]" variable="citation-number" />
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","title":"Paper 1","type":"book"},{"id":"ITEM-2","title":"Paper 2","type":"book"},{"id":"ITEM-3","title":"Paper 3","type":"book"},{"id":"ITEM-4","title":"Paper 4","type":"book"},{"id":"ITEM-5","title":"Paper 5","type":"book"},{"id":"ITEM-6","title":"Paper 6","type":"book"},{"id":"ITEM-7","title":"Paper 7","type":"book"},{"id":"ITEM-8","title":"Paper 8","type":"book"},{"id":"ITEM-9","title":"Paper 9","type":"book"},{"id":"ITEM-10","title":"Paper 10","type":"book"},{"id":"ITEM-11","title":"Paper 11","type":"book"}]
    """
    When I cite the following items:
    """
    [[{"id":"ITEM-1"},{"id":"ITEM-2"},{"id":"ITEM-3"},{"id":"ITEM-4"},{"id":"ITEM-5"},{"id":"ITEM-6"},{"id":"ITEM-7"},{"id":"ITEM-8"},{"id":"ITEM-9"},{"id":"ITEM-10"},{"id":"ITEM-11"}],[{"id":"ITEM-1"},{"id":"ITEM-3"},{"id":"ITEM-4"},{"id":"ITEM-5"},{"id":"ITEM-7"},{"id":"ITEM-9"},{"id":"ITEM-10"},{"id":"ITEM-11"}]]
    """
    Then the results should be:
      | ([1]–[11])  |
      | ([1], [3]–[5], [7], [9]–[11]) |
