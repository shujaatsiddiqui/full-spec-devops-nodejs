var chai = require('chai');
const request = require("supertest");
const app = require("../server");
var chaiHttp = require('chai-http');
chai.use(chaiHttp);
chai.should();

describe("GET /api/hello", () => {
  it.only("it should be an object", (done) => {
    request(app).get("/api/hello").
    end((err, res) => {
        res.should.have.status(200);
        res.body.should.be.a('object');
        done();
     });
  })
});
