netsh nps add np name="A6-Allow-RADIUS" state=enable processingorder=1 conditionid=0x1006 conditiondata="0 00:00-24:00" profileid=0x1001 profiledata="0"
netsh nps show np
