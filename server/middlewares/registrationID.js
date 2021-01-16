function myUniqueID() {
  const currentTime = Date.now().toString(36);
  const randomString1 = Math.random().toString(36).substr(5, 6);
  const randomString2 = Math.random().toString(36).substr(11, 12);
  return (randomString1 + currentTime + randomString2).toUpperCase();
}

module.exports = myUniqueID;
