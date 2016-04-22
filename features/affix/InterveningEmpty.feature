Feature: affix
  As a CSL cite processor hacker
  I want the test affix_InterveningEmpty to pass

  @citation @affix
  Scenario: Intervening Empty
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
      <macro name="author">
        <names variable="author">
          <name/>
        </names>
      </macro>
      <macro name="title">
        <text variable="title"/>
      </macro>
      <macro name="journal">
        <text variable="container-title"/>
      </macro>
      <macro name="date">
        <date variable="issued">
          <date-part name="year"/>
        </date>
      </macro>
      <citation>
        <layout suffix=".">
          <text macro="author"/>
          <text macro="title" prefix=". "/>
          <text macro="journal"/>
          <text macro="date" prefix=". "/>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John"}],"id":"ITEM-1","issued":{"date-parts":[["1965","6","1"]]},"title":"His Anonymous Life","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    John Doe. His Anonymous Life. 1965.
    """
