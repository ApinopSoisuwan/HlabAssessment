** หมายเหตุเนื่องจาก ภายในการบ้าน Pre-Assessment จะต้องเข้าไปยัง Shopee เพื่อค้นหา สินค้า babys แต่เนื่องจากว่าตอนนี้
shopee ได้ บล๊อกการรัน e2e เนื่องจากปัองกันการ Web scrapper ทางผู้สอบจึงจะต้องเปลื่ยนลิ้งการเข้าเป็นของ ทาง Open Planform
ที่ข้อมูล ไม่ครบหรือไม่เพียงพอ ขออภัยในความไม่สะดวกครับ **

# วิธีการรัน Robot Framework ด้วย Selenium

เอกสารนี้อธิบายวิธีการติดตั้งและรัน Robot Framework พร้อม Selenium ตั้งแต่เริ่มต้น

## ขั้นตอนที่ 1: ติดตั้ง Python

1. ไปที่เว็บไซต์ [Python](https://www.python.org/) และดาวน์โหลด Python เวอร์ชันล่าสุดที่เหมาะสมกับระบบปฏิบัติการของคุณ (Windows, macOS, Linux)
2. ในระหว่างการติดตั้งให้เลือก **"Add Python to PATH"**

## ขั้นตอนที่ 2: ตรวจสอบการติดตั้ง Python

หลังจากติดตั้ง Python แล้ว ให้เปิด Command Prompt (Windows) หรือ Terminal (macOS/Linux) และรันคำสั่งต่อไปนี้เพื่อตรวจสอบเวอร์ชันของ Python:

```bash
python --version
```

หากการติดตั้งสำเร็จ คุณจะเห็นข้อความแสดงเวอร์ชันของ Python (เช่น `Python 3.x.x`)

## ขั้นตอนที่ 3: ติดตั้ง pip (ถ้ายังไม่ได้ติดตั้ง)

`pip` คือเครื่องมือจัดการแพ็กเกจของ Python ซึ่งโดยปกติแล้วจะติดตั้งมาพร้อมกับ Python หากต้องการตรวจสอบว่า `pip` ถูกติดตั้งแล้วหรือไม่ สามารถรันคำสั่งนี้:

```bash
pip --version
```

ถ้ายังไม่ได้ติดตั้งสามารถติดตั้งได้โดยรันคำสั่งนี้:

```bash
python -m ensurepip --upgrade
```

## ขั้นตอนที่ 4: ติดตั้ง Robot Framework

ใช้คำสั่ง `pip` เพื่อติดตั้ง Robot Framework:

```bash
pip install robotframework
```

## ขั้นตอนที่ 5: ติดตั้ง Selenium Library

เพื่อให้ Robot Framework สามารถใช้งาน Selenium ได้ จำเป็นต้องติดตั้ง `robotframework-seleniumlibrary`:

```bash
pip install robotframework-seleniumlibrary
```

## ขั้นตอนที่ 6: ติดตั้ง WebDriver

Robot Framework Selenium ใช้ WebDriver (เช่น ChromeDriver หรือ GeckoDriver) เพื่อควบคุมเบราว์เซอร์ในการทดสอบ

### สำหรับ Google Chrome:
1. ดาวน์โหลด [ChromeDriver](https://sites.google.com/chromium.org/driver/) เวอร์ชันที่ตรงกับเบราว์เซอร์ Chrome ที่คุณใช้อยู่
2. แตกไฟล์และเพิ่ม path ของ ChromeDriver ลงในระบบ `PATH` หรือเก็บไฟล์ไว้ในโฟลเดอร์ที่คุณสามารถเข้าถึงได้ง่าย

### สำหรับ Firefox:
1. ดาวน์โหลด [GeckoDriver](https://github.com/mozilla/geckodriver/releases) สำหรับ Firefox
2. แตกไฟล์และเพิ่ม path ของ GeckoDriver ลงในระบบ `PATH` หรือเก็บไฟล์ไว้ในโฟลเดอร์ที่คุณสามารถเข้าถึงได้ง่าย

## ขั้นตอนที่ 7: สร้างไฟล์ Test Case

สร้างไฟล์ใหม่ชื่อว่า `test.robot` และเพิ่มเนื้อหาดังตัวอย่างนี้ (ทดสอบเว็บไซต์):

```robot
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.example.com

*** Test Cases ***
Open Website
    Open Browser  ${URL}  chrome
    Title Should Be  Example Domain
    Close Browser
```

## ขั้นตอนที่ 8: รัน Test Case

ให้รันคำสั่งนี้เพื่อทดสอบ:

```bash
robot test.robot
```

Robot Framework จะทำการรันทดสอบและแสดงผลลัพธ์ในคอนโซล พร้อมกับไฟล์รายงาน HTML

## ขั้นตอนที่ 9: ดูผลการทดสอบ

หลังจากรันคำสั่ง `robot test.robot` แล้ว จะมีไฟล์ที่ถูกสร้างขึ้นในโฟลเดอร์ทำงานของคุณดังนี้:

- `log.html`: รายละเอียดการรันทดสอบ
- `report.html`: สรุปผลการทดสอบ
- `output.xml`: ผลการทดสอบในรูปแบบ XML (สำหรับการวิเคราะห์ผล)
