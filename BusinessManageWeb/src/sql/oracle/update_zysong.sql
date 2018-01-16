update T_FMTS set XML_STREAM = '<FMT><NAME>MSFMT</NAME><SCAN>FIELDS-DB</SCAN><SERVERITY>MEDIUM2</SERVERITY><DUPLICATES>YES</DUPLICATES><RECORD>VARIABLE</RECORD><SEPARATOR>/010</SEPARATOR><CHECKPART>NO</CHECKPART><FIELDSEP>|</FIELDSEP><F><FNAME>:FIELD-01:</FNAME><FTYPE>NAME</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>1</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>NAME</FTSCAN><FIGROUP>1</FIGROUP></F><F><FNAME>:FIELD-02:</FNAME><FTYPE>NAME</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>2</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>NAME</FTSCAN><FIGROUP>2</FIGROUP></F><F><FNAME>:FIELD-03:</FNAME><FTYPE>TYPE</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>3</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>TYPE</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-04:</FNAME><FTYPE>NATIONAL</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>4</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>NATIONAL</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-05:</FNAME><FTYPE>PASSPORT</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>5</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>PASSPORT</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-06:</FNAME><FTYPE>BIC</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>6</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>BIC</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-07:</FNAME><FTYPE>ADDRESS</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>7</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>ADDRESS</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-08:</FNAME><FTYPE>CITY</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>8</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>CITY</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-09:</FNAME><FTYPE>STATE</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>9</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>STATE</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-10:</FNAME><FTYPE>COUNTRY</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>10</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>COUNTRY</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-11:</FNAME><FTYPE>DATE OF BIRTH</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>11</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>DATE-OF-BIRTH</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-12:</FNAME><FTYPE>USER1</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>12</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>NONE</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-13:</FNAME><FTYPE>SEARCH CODE</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>13</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>CODE</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-14:</FNAME><FTYPE>MEMBERCODE</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>14</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>NONE</FTSCAN><FIGROUP>-1</FIGROUP></F></FMT>' where NAME = 'MSFMT';

--roll back
update T_FMTS set XML_STREAM = '<FMT><NAME>MSFMT</NAME><SCAN>FIELDS-DB</SCAN><SERVERITY>MEDIUM2</SERVERITY><DUPLICATES>YES</DUPLICATES><RECORD>VARIABLE</RECORD><SEPARATOR>/010</SEPARATOR><CHECKPART>NO</CHECKPART><FIELDSEP>|</FIELDSEP><F><FNAME>:FIELD-01:</FNAME><FTYPE>NAME</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>1</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>NAME</FTSCAN><FIGROUP>1</FIGROUP></F><F><FNAME>:FIELD-02:</FNAME><FTYPE>NAME</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>2</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>NAME</FTSCAN><FIGROUP>2</FIGROUP></F><F><FNAME>:FIELD-03:</FNAME><FTYPE>TYPE</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>3</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>TYPE</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-04:</FNAME><FTYPE>NATIONAL</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>4</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>NATIONAL</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-05:</FNAME><FTYPE>PASSPORT</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>5</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>PASSPORT</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-06:</FNAME><FTYPE>BIC</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>6</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>BIC</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-07:</FNAME><FTYPE>ADDRESS</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>7</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>ADDRESS</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-08:</FNAME><FTYPE>CITY</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>8</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>CITY</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-09:</FNAME><FTYPE>STATE</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>9</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>STATE</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-10:</FNAME><FTYPE>COUNTRY</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>10</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>COUNTRY</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-11:</FNAME><FTYPE>DATE OF BIRTH</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>11</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>DATE-OF-BIRTH</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-12:</FNAME><FTYPE>USER1</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>12</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>NONE</FTSCAN><FIGROUP>-1</FIGROUP></F><F><FNAME>:FIELD-13:</FNAME><FTYPE>SEARCH CODE</FTYPE><FFMT>VARIABLE</FFMT><FVARPOS>13</FVARPOS><FFIXBEG>-1</FFIXBEG><FFIXEND>-1</FFIXEND><FTSCAN>CODE</FTSCAN><FIGROUP>-1</FIGROUP></F></FMT>' where NAME = 'MSFMT';