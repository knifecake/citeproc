Feature: page
  As a CSL cite processor hacker
  I want the test page_Minimal to pass

  @citation @page @citation-items
  Scenario: Minimal
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="note"
          version="1.0"
          page-range-format="minimal">
      <info>
        <id />
        <title />
        <updated>2009-08-10T04:49:00+09:00</updated>
      </info>
      <citation>
        <layout>
          <text variable="title"/>
          <text variable="page" prefix=", at "/>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","page":"101-108","title":"Example A","type":"book"},{"id":"ITEM-2","page":"3-10","title":"Example B","type":"book"},{"id":"ITEM-3","page":"71-72","title":"Example C","type":"book"},{"id":"ITEM-4","page":"96-117","title":"Example D","type":"book"},{"id":"ITEM-5","page":"100-4","title":"Example E","type":"book"},{"id":"ITEM-6","page":"600-13","title":"Example F","type":"book"},{"id":"ITEM-7","page":"1100-23","title":"Example G","type":"book"},{"id":"ITEM-8","page":"107-108","title":"Example H","type":"book"},{"id":"ITEM-9","page":"505-17","title":"Example I","type":"book"},{"id":"ITEM-10","page":"1002-1006","title":"Example J","type":"book"},{"id":"ITEM-11","page":"321-325","title":"Example K","type":"book"},{"id":"ITEM-12","page":"415-532","title":"Example L","type":"book"},{"id":"ITEM-13","page":"1536-538","title":"Example M","type":"book"},{"id":"ITEM-14","page":"11564-11568","title":"Example N","type":"book"},{"id":"ITEM-15","page":"11564-11578","title":"Example O","type":"book"},{"id":"ITEM-16","page":"13792-13803","title":"Example P","type":"book"},{"id":"ITEM-17","page":"1496-504","title":"Example Q","type":"book"},{"id":"ITEM-18","page":"2787-816","title":"Example R","type":"book"},{"id":"ITEM-19","page":"n11564 - n1568","title":"Example S","type":"book"},{"id":"ITEM-20","page":"n11564 - 1568","title":"Example T","type":"book"}]
    """
    When I cite the following items:
    """
    [[{"id":"ITEM-1"}],[{"id":"ITEM-2"}],[{"id":"ITEM-3"}],[{"id":"ITEM-4"}],[{"id":"ITEM-5"}],[{"id":"ITEM-6"}],[{"id":"ITEM-7"}],[{"id":"ITEM-8"}],[{"id":"ITEM-9"}],[{"id":"ITEM-10"}],[{"id":"ITEM-11"}],[{"id":"ITEM-12"}],[{"id":"ITEM-13"}],[{"id":"ITEM-14"}],[{"id":"ITEM-15"}],[{"id":"ITEM-16"}],[{"id":"ITEM-17"}],[{"id":"ITEM-18"}],[{"id":"ITEM-19"}],[{"id":"ITEM-20"}]]
    """
    Then the results should be:
      | Example A, at 101–8    |
      | Example B, at 3–10     |
      | Example C, at 71–2     |
      | Example D, at 96–117   |
      | Example E, at 100–4    |
      | Example F, at 600–13   |
      | Example G, at 1100–23  |
      | Example H, at 107–8    |
      | Example I, at 505–17   |
      | Example J, at 1002–6   |
      | Example K, at 321–5    |
      | Example L, at 415–532  |
      | Example M, at 1536–8   |
      | Example N, at 11564–8  |
      | Example O, at 11564–78 |
      | Example P, at 13792–803 |
      | Example Q, at 1496–504 |
      | Example R, at 2787–816 |
      | Example S, at n11564–8 |
      | Example T, at n11564–8 |
