Feature: sort
  As a CSL cite processor hacker
  I want the test sort_AguStyleReverseGroups to pass

  @bibliography @sort
  Scenario: Agu Style Reverse Groups
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
      <macro name="key-creators">
        <names variable="author">
          <name name-as-sort-order="all" sort-separator=" "/>
          <substitute>
            <names variable="editor" />
          </substitute>
        </names>
      </macro>
      <macro name="key-creators-count">
        <names variable="author">
          <name form="count" />
          <substitute>
            <names variable="editor" />
          </substitute>
        </names>
      </macro>
      <macro name="key-year">
        <date variable="issued">
          <date-part name="year" />
        </date>
      </macro>
      <macro name="creators">
        <names variable="author">
          <name and="text" delimiter=", " initialize-with="." name-as-sort-order="first" sort-separator=", " />
          <substitute>
            <names variable="editor" />
          </substitute>
        </names>
      </macro>
      <macro name="year">
        <group prefix=" (" suffix=")">
          <date variable="issued">
            <date-part name="year" />
          </date>
          <text variable="year-suffix" />
        </group>
      </macro>
      <citation 
             collapse="year-suffix"
             disambiguate-add-year-suffix="true">
        <layout>
          <text macro="creators" />
          <text macro="year" />
        </layout>
      </citation>
      <bibliography>
        <sort>
          <key macro="key-creators" names-min="1" names-use-first="1" />
          <key macro="key-creators-count" names-min="3" names-use-first="3" sort="descending" />
          <key macro="key-creators" names-min="3" names-use-first="1" />
          <key macro="key-year" />
        </sort>
        <layout>
          <text macro="creators" />
          <text macro="year" />
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Smith","given":"Al","static-ordering":false}],"id":"item-1","issued":{"date-parts":[["1989"]]},"title":"Book One","type":"book"},{"author":[{"family":"Smith","given":"Al","static-ordering":false}],"id":"item-2","issued":{"date-parts":[["1989"]]},"title":"Book Two","type":"book"},{"editor":[{"family":"Smith","given":"Al","static-ordering":false}],"id":"item-3","issued":{"date-parts":[["1991"]]},"title":"Book Three","type":"book"},{"editor":[{"family":"Smith","given":"Al","static-ordering":false},{"family":"Allen","given":"Carl","static-ordering":false}],"id":"item-4","issued":{"date-parts":[["2000"]]},"title":"Book Four","type":"book"},{"editor":[{"family":"Smith","given":"Al","static-ordering":false},{"family":"Frank","given":"Beauregarde","static-ordering":false}],"id":"item-5","issued":{"date-parts":[["1995"]]},"title":"Book Five","type":"book"},{"editor":[{"family":"Smith","given":"Al","static-ordering":false},{"family":"Frank","given":"Beauregarde","static-ordering":false}],"id":"item-6","issued":{"date-parts":[["1997"]]},"title":"Book Six","type":"book"},{"editor":[{"family":"Smith","given":"Al","static-ordering":false},{"family":"Roberts","given":"Lionel","static-ordering":false},{"family":"Jones","given":"Theresa","static-ordering":false}],"id":"item-7","issued":{"date-parts":[["1993"]]},"title":"Book Seven","type":"book"},{"editor":[{"family":"Smith","given":"Al","static-ordering":false},{"family":"Jones","given":"Theresa","static-ordering":false},{"family":"Roberts","given":"Lionel","static-ordering":false}],"id":"item-8","issued":{"date-parts":[["1997"]]},"title":"Book Eight","type":"book"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">Smith, A., L. Roberts, and T. Jones (1993)</div>
      <div class="csl-entry">Smith, A., T. Jones, and L. Roberts (1997)</div>
      <div class="csl-entry">Smith, A. and C. Allen (2000)</div>
      <div class="csl-entry">Smith, A. and B. Frank (1995)</div>
      <div class="csl-entry">Smith, A. and B. Frank (1997)</div>
      <div class="csl-entry">Smith, A. (1989a)</div>
      <div class="csl-entry">Smith, A. (1989b)</div>
      <div class="csl-entry">Smith, A. (1991)</div>
    </div>
    """
