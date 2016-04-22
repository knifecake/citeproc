Feature: sort
  As a CSL cite processor hacker
  I want the test sort_CaseInsensitiveBibliography to pass

  @bibliography @sort
  Scenario: Case Insensitive Bibliography
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
          <name name-as-sort-order="all" and="symbol" sort-separator=", " 
                initialize-with="." delimiter-precedes-last="never" delimiter=", "/>
          <label form="short" prefix=" (" suffix=".)" text-case="capitalize-first"/>
          <substitute>
            <names variable="editor"/>
            <text value="Anon"/>
          </substitute>
        </names>
      </macro>
      <citation>
        <layout>
          <text value="dummy"/>
        </layout>
      </citation>
      <bibliography>
        <sort>
          <key macro="author"/>
        </sort>
        <layout>
          <text macro="author"/>
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"ABC"}],"id":"ITEM-1","type":"book"},{"author":[{"family":"Aaa"}],"id":"ITEM-2","type":"book"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">Aaa</div>
      <div class="csl-entry">ABC</div>
    </div>
    """
