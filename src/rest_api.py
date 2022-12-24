import asyncio
import hashlib
import uuid

import uvicorn
from fastapi import FastAPI, HTTPException

import dao
from dao import init_zk
from db_model import init_msdb
from rest_model import *
from utils import Const, logger

app = FastAPI()


@app.on_event("startup")
async def startup():
    # await init_msdb()
    # await init_zk()
    pass


@app.post("/register", status_code=201, response_model=RegisterAccountResponse)
async def register_account(payload: RegisterAccountRequest):
    _username = payload.username
    # query the username
    user = await dao.find_user_by_username(_username)
    if user is not None:
        raise HTTPException(400, detail="Already exists")
    else:
        # insert user
        _display_name = payload.display_name or _username.upper()
        user = await dao.insert_user(_username, _display_name)
        resp = RegisterAccountResponse(
            username=user["username"],
            user_id=user["user_id"],
            display_name=user["display_name"],
        )
        return resp


if __name__ == "__main__":
    uvicorn.run(app="rest_api:app", reload=True)
