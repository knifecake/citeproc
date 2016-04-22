Feature: date
  As a CSL cite processor hacker
  I want the test date_LocalizedDateFormats-ja-JP to pass

  @citation @date
  Scenario: Localized Date Formats-ja-JP
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
      <locale>
        <date form="text">
          <date-part name="year" suffix="&#24180;"/>
          <date-part name="month" form="numeric" suffix="&#26376;"/>
          <date-part name="day" suffix="&#26085;"/>
        </date>
        <date form="numeric">
          <date-part name="year" suffix="&#24180;"/>
          <date-part name="month" form="numeric" suffix="&#26376;"/>
          <date-part name="day" suffix="&#26085;"/>
        </date>
      </locale>
      <citation>
        <layout>
          <group delimiter="&#x0A;">
            <date variable="issued" form="text" date-parts="year-month-day"/>
            <date variable="issued" form="text" date-parts="year-month"/>
            <date variable="issued" form="text" date-parts="year"/>
            <date variable="issued" form="numeric" date-parts="year-month-day"/>
            <date variable="issued" form="numeric" date-parts="year-month"/>
            <date variable="issued" form="numeric" date-parts="year"/>
          </group>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","issued":{"date-parts":[[1998,4,10]]},"title":"BookA"}]
    """
    When I cite all items
    Then the result should be:
    """
    1998年4月10日
    1998年4月
    1998年
    1998年4月10日
    1998年4月
    1998年
    """
