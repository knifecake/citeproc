Feature: sort
  As a CSL cite processor hacker
  I want the test sort_CaseInsensitiveCitation to pass

  @citation @sort
  Scenario: Case Insensitive Citation
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
          <key variable="title"/>
        </sort>
        <layout delimiter=" - ">
          <text variable="title"/>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","title":"Xyz","type":"book"},{"id":"ITEM-2","title":"ABC","type":"book"},{"id":"ITEM-3","title":"Aaa","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Aaa - ABC - Xyz
    """
