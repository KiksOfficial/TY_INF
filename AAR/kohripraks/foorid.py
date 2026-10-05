import RPi.GPIO as GPIO
import time


AUTO_PUNANE = 14
AUTO_KOLLANE = 15
AUTO_ROHELINE = 18

JALA_PUNANE = 23
JALA_ROHELINE = 24

SININE = 25

global JALA_SEIS
JALA_SEIS = True

NUPP = 17

SEKUND_MURD = 2 / 6

def setup():
    #GPIO.setmode(GPIO.BOARD)
    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)

    GPIO.setup(NUPP, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    GPIO.add_event_detect(NUPP, GPIO.FALLING, callback=nupu_vajutus)

    #auto
    GPIO.setup(18, GPIO.OUT)
    GPIO.setup(14, GPIO.OUT)
    GPIO.setup(15, GPIO.OUT)

    #jalakäija
    GPIO.setup(23, GPIO.OUT)
    GPIO.setup(24, GPIO.OUT)
    GPIO.setup(25, GPIO.OUT)


    #kõik off
    GPIO.output(AUTO_PUNANE, GPIO.LOW)
    GPIO.output(AUTO_KOLLANE, GPIO.LOW)
    GPIO.output(AUTO_ROHELINE, GPIO.LOW)

    GPIO.output(JALA_PUNANE, GPIO.HIGH)
    GPIO.output(JALA_ROHELINE, GPIO.LOW)
    GPIO.output(SININE, GPIO.LOW)

def auto_punane_on():
    global JALA_SEIS

    GPIO.output(AUTO_KOLLANE, GPIO.LOW)
    GPIO.output(AUTO_PUNANE, GPIO.HIGH)
    print(JALA_SEIS)
    algus = JALA_SEIS

    if JALA_SEIS == False:
        GPIO.output(SININE, GPIO.LOW)
        GPIO.output(JALA_PUNANE, GPIO.LOW)
        GPIO.output(JALA_ROHELINE, GPIO.HIGH)

    time.sleep(5)

    GPIO.output(JALA_ROHELINE, GPIO.LOW)
    GPIO.output(AUTO_PUNANE, GPIO.LOW)

    if JALA_SEIS == algus:
        JALA_SEIS = True
        GPIO.output(JALA_PUNANE, GPIO.HIGH)

def auto_kollane1_on():
    GPIO.output(AUTO_PUNANE, GPIO.LOW)
    GPIO.output(AUTO_KOLLANE, GPIO.HIGH)
    time.sleep(1)

def auto_roheline_on():
    GPIO.output(AUTO_KOLLANE, GPIO.LOW)
    GPIO.output(AUTO_ROHELINE, GPIO.HIGH)
    time.sleep(5)
    GPIO.output(AUTO_ROHELINE, GPIO.LOW)

def vilguta_auto_kollast():
    GPIO.output(AUTO_KOLLANE, GPIO.HIGH)
    time.sleep(SEKUND_MURD)
    GPIO.output(AUTO_KOLLANE, GPIO.LOW)
    time.sleep(SEKUND_MURD)

def nupu_vajutus(channel):
    global JALA_SEIS
    print("jalaseis = false")
    GPIO.output(SININE, GPIO.HIGH)
    JALA_SEIS = False

try:
    setup()
    while True:
        auto_punane_on()
        auto_kollane1_on()
        auto_roheline_on()

        for i in range(3):
            vilguta_auto_kollast()

except KeyboardInterrupt:
    print("Keyboard interrupt")
finally:
    GPIO.cleanup()

