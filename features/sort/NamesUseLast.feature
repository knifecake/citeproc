Feature: sort
  As a CSL cite processor hacker
  I want the test sort_NamesUseLast to pass

  @bibliography @sort
  Scenario: Names Use Last
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
          <name name-as-sort-order="first" sort-separator=" "/>
          <substitute>
            <names variable="editor" />
          </substitute>
        </names>
      </macro>
      <macro name="theyear">
        <date variable="issued">
          <date-part name="year" />
        </date>
      </macro>
      <citation>
        <layout>
          <text value="Ignore me" />
        </layout>
      </citation>
      <bibliography et-al-min="3" et-al-use-first="2" et-al-use-last="false">
        <sort>
          <key macro="author" names-min="3" names-use-first="1" names-use-last="true"/>
          <key macro="theyear" />
        </sort>
        <layout>
          <group delimiter=" ">
            <names variable="author">
              <name/>
            </names>
            <text variable="title" />
            <date variable="issued" date-parts="year" form="text"/>
          </group>
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John"},{"family":"Anderson","given":"Alvin"},{"family":"Zotero","given":"Zoe"}],"id":"ITEM-1","issued":{"date-parts":[["1999"]]},"title":"Book Two","type":"book"},{"author":[{"family":"Doe","given":"John"},{"family":"Xerxes","given":"Xavier"},{"family":"Boop","given":"Betty"}],"id":"ITEM-2","issued":{"date-parts":[["2000"]]},"title":"Book One","type":"book"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">John Doe, Xavier Xerxes, et al. Book One 2000</div>
      <div class="csl-entry">John Doe, Alvin Anderson, et al. Book Two 1999</div>
    </div>
    """
