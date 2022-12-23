import hashlib
import uuid

import uvicorn
from fastapi import FastAPI

import dao
from rest_model import *
from utils import Const, logger

app = FastAPI()


@app.get("/")
async def read_root():
    return {"Hello": "World"}


@app.post("/register", status_code=201, response_model=RegisterAccountResponse)
async def register_account(payload: RegisterAccountRequest):
    _username = payload.username
    # query the username
    dao.find_user_by_username(_username)
    resp = RegisterAccountResponse(username=_username, user_id=str(uuid.uuid4()))
    return resp


if __name__ == "__main__":
    uvicorn.run(app="rest_api:app", reload=True)
