Feature: nameattr
  As a CSL cite processor hacker
  I want the test nameattr_EtAlUseFirstOnStyleInCitation to pass

  @citation @nameattr
  Scenario: Et Al Use First On Style In Citation
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
            <name et-al-min="3" delimiter=", " et-al-use-first="2"/>
          </names>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John"},{"family":"Roe","given":"Jane"},{"family":"Snoakes","given":"Richard"}],"id":"ITEM-1","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    John Doe, Jane Roe, et al.
    """
