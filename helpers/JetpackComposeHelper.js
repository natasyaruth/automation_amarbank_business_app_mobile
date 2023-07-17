const Helper = require("@codeceptjs/helper");

function getAndroidKeyCodes(input) {
  const keyCodeMapping = {
    A: 29,
    B: 30,
    C: 31,
    D: 32,
    E: 33,
    F: 34,
    G: 35,
    H: 36,
    I: 37,
    J: 38,
    K: 39,
    L: 40,
    M: 41,
    N: 42,
    O: 43,
    P: 44,
    Q: 45,
    R: 46,
    S: 47,
    T: 48,
    U: 49,
    V: 50,
    W: 51,
    X: 52,
    Y: 53,
    Z: 54,
    0: 7,
    1: 8,
    2: 9,
    3: 10,
    4: 11,
    5: 12,
    6: 13,
    7: 14,
    8: 15,
    9: 16,
    " ": 62,
    "\n": 66,
    "\b": 67,
    "@": 77,
    "#": 18,
    $: 72,
    "%": 55,
    "^": 68,
    "&": 71,
    "*": 17,
    "(": 16,
    ")": 7,
    "-": 69,
    _: 70,
    "+": 75,
    "=": 70,
    "[": 71,
    "]": 72,
    "{": 68,
    "}": 69,
    "\\": 73,
    "|": 74,
    ";": 74,
    ":": 243,
    "'": 75,
    '"': 244,
    ",": 55,
    "<": 56,
    ".": 56,
    ">": 57,
    "/": 76,
    "?": 244,
    "`": 68,
    "~": 69,
    "!": 8,
    a: 29,
    b: 30,
    c: 31,
    d: 32,
    e: 33,
    f: 34,
    g: 35,
    h: 36,
    i: 37,
    j: 38,
    k: 39,
    l: 40,
    m: 41,
    n: 42,
    o: 43,
    p: 44,
    q: 45,
    r: 46,
    s: 47,
    t: 48,
    u: 49,
    v: 50,
    w: 51,
    x: 52,
    y: 53,
    z: 54,
  };

  let keyEvents = [];

  for (let ch of input) {
    if (ch in keyCodeMapping) {
      keyEvents.push(keyCodeMapping[ch]);
    }
  }

  return keyEvents;
}

class JetpackComposeHelper extends Helper {
  // before/after hooks
  /**
   * @protected
   */
  _before() {
    // remove if not used
  }

  /**
   * @protected
   */
  _after() {
    // remove if not used
  }

  // add custom methods here
  // If you need to access other helpers
  // use: this.helpers['helperName']

  async setText(identifier, input) {
    const { Appium } = this.helpers;
    await Appium.seeElement(identifier);
    await Appium.tap(identifier);
    const keyEvents = getAndroidKeyCodes(input);
    for (const keyEvent of keyEvents) {
      await Appium.sendDeviceKeyEvent(keyEvent);
    }
  }
}

module.exports = JetpackComposeHelper;
