Feature: sort
  As a CSL cite processor hacker
  I want the test sort_LatinUnicode to pass

  @citation @sort @citations
  Scenario: Latin Unicode
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
          <name form="short" />
        </names>
      </macro>
      <citation>
        <sort>
          <key macro="author" />
        </sort>
        <layout delimiter="; ">
          <text macro="author" />
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Aalto","given":"Alan"}],"id":"ITEM-1","type":"book"},{"author":[{"family":"Álvarez","given":"Ajax"}],"id":"ITEM-2","type":"book"}]
    """
    And I have a citations input
    When I cite all items
    Then the result should be:
    """
    >>[0] Aalto; Álvarez
    """
