const PAYMENT_URL = "https://us-central1-jaisalmeria-handloom.cloudfunctions.net/customFunctions/payment";

const ORDER_DATA = {
  "custID": "USER_1122334455",
  "custEmail": "someemail@gmail.com",
  "custPhone": "7777777777"
};

const STATUS_LOADING = "PAYMENT_LOADING";
const STATUS_SUCCESSFUL = "PAYMENT_SUCCESSFUL";
const STATUS_PENDING = "PAYMENT_PENDING";
const STATUS_FAILED = "PAYMENT_FAILED";
const STATUS_CHECKSUM_FAILED = "PAYMENT_CHECKSUM_FAILED";

// const BACKEND_URL = "http://ec2-3-83-238-202.compute-1.amazonaws.com:3000";
const BACKEND_URL = "http://localhost:3000";