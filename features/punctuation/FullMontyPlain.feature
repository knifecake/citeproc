Feature: punctuation
  As a CSL cite processor hacker
  I want the test punctuation_FullMontyPlain to pass

  @citation @punctuation
  Scenario: Full Monty Plain
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
          <group delimiter="&#x0A;">
            <text value="ENDING IN COLON"/>
            <group>
              <text value="colon" suffix=":"/>
              <text value="colon" prefix=": "/>
            </group>
            <group>
              <text value="period" suffix="."/>
              <text value="colon" prefix=": "/>
            </group>
            <group>
              <text value="semicolon" suffix=";"/>
              <text value="colon" prefix=": "/>
            </group>
            <group>
              <text value="exclamation" suffix="!"/>
              <text value="colon" prefix=": "/>
            </group>
            <group>
              <text value="question" suffix="?"/>
              <text value="colon" prefix=": "/>
            </group>
            <group>
              <text value="comma" suffix=","/>
              <text value="colon" prefix=": "/>
            </group>
            <text value="&#x0A;ENDING IN PERIOD"/>
            <group>
              <text value="colon" suffix=":"/>
              <text value="period" prefix=". "/>
            </group>
            <group>
              <text value="period" suffix="."/>
              <text value="period" prefix=". "/>
            </group>
            <group>
              <text value="semicolon" suffix=";"/>
              <text value="period" prefix=". "/>
            </group>
            <group>
              <text value="exclamation" suffix="!"/>
              <text value="period" prefix=". "/>
            </group>
            <group>
              <text value="question" suffix="?"/>
              <text value="period" prefix=". "/>
            </group>
            <group>
              <text value="comma" suffix=","/>
              <text value="period" prefix=". "/>
            </group>
            <text value="&#x0A;ENDING IN SEMICOLON"/>
            <group>
              <text value="colon" suffix=":"/>
              <text value="semicolon" prefix="; "/>
            </group>
            <group>
              <text value="period" suffix="."/>
              <text value="semicolon" prefix="; "/>
            </group>
            <group>
              <text value="semicolon" suffix=";"/>
              <text value="semicolon" prefix="; "/>
            </group>
            <group>
              <text value="exclamation" suffix="!"/>
              <text value="semicolon" prefix="; "/>
            </group>
            <group>
              <text value="question" suffix="?"/>
              <text value="semicolon" prefix="; "/>
            </group>
            <group>
              <text value="comma" suffix=","/>
              <text value="semicolon" prefix="; "/>
            </group>
            <text value="&#x0A;ENDING IN EXCLAMATION"/>
            <group>
              <text value="colon" suffix=":"/>
              <text value="exclamation" prefix="! "/>
            </group>
            <group>
              <text value="period" suffix="."/>
              <text value="exclamation" prefix="! "/>
            </group>
            <group>
              <text value="semicolon" suffix=";"/>
              <text value="exclamation" prefix="! "/>
            </group>
            <group>
              <text value="exclamation" suffix="!"/>
              <text value="exclamation" prefix="! "/>
            </group>
            <group>
              <text value="question" suffix="?"/>
              <text value="exclamation" prefix="! "/>
            </group>
            <group>
              <text value="comma" suffix=","/>
              <text value="exclamation" prefix="! "/>
            </group>
            <text value="&#x0A;ENDING IN QUESTION"/>
            <group>]
              <text value="colon" suffix=":"/>
              <text value="question" prefix="? "/>
            </group>
            <group>
              <text value="period" suffix="."/>
              <text value="question" prefix="? "/>
            </group>
            <group>
              <text value="semicolon" suffix=";"/>
              <text value="question" prefix="? "/>
            </group>
            <group>
              <text value="exclamation" suffix="!"/>
              <text value="question" prefix="? "/>
            </group>
            <group>
              <text value="question" suffix="?"/>
              <text value="question" prefix="? "/>
            </group>
            <group>
              <text value="comma" suffix=","/>
              <text value="question" prefix="? "/>
            </group>
            <text value="&#x0A;ENDING IN COMMA"/>
            <group>]
              <text value="colon" suffix=":"/>
              <text value="comma" prefix=", "/>
            </group>
            <group>
              <text value="period" suffix="."/>
              <text value="comma" prefix=", "/>
            </group>
            <group>
              <text value="semicolon" suffix=";"/>
              <text value="comma" prefix=", "/>
            </group>
            <group>
              <text value="exclamation" suffix="!"/>
              <text value="comma" prefix=", "/>
            </group>
            <group>
              <text value="question" suffix="?"/>
              <text value="comma" prefix=", "/>
            </group>
            <group>
              <text value="comma" suffix=","/>
              <text value="comma" prefix=", "/>
            </group>
          </group>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    ENDING IN COLON
    colon: colon
    period. colon
    semicolon; colon
    exclamation! colon
    question? colon
    comma,: colon
    
    ENDING IN PERIOD
    colon: period
    period. period
    semicolon; period
    exclamation! period
    question? period
    comma,. period
    
    ENDING IN SEMICOLON
    colon:; semicolon
    period.; semicolon
    semicolon;; semicolon
    exclamation!; semicolon
    question?; semicolon
    comma,; semicolon
    
    ENDING IN EXCLAMATION
    colon: exclamation
    period. exclamation
    semicolon; exclamation
    exclamation! exclamation
    question? exclamation
    comma,! exclamation
    
    ENDING IN QUESTION
    colon: question
    period. question
    semicolon; question
    exclamation! question
    question? question
    comma,? question
    
    ENDING IN COMMA
    colon:, comma
    period., comma
    semicolon;, comma
    exclamation!, comma
    question?, comma
    comma,, comma
    """
