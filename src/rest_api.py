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


@app.post("/register", status_code=201, response_model=UserProfileResponse)
async def register_account(payload: RegisterAccountRequest):
    _username = payload.username
    # query the username
    user = await dao.find_user_by_username(_username)
    if user is not None:
        raise HTTPException(400, detail="Already exists")
    else:
        # insert user
        _display_name = payload.display_name or _username.upper()
        return await dao.register_user(_username, _display_name)


@app.get(
    "/profiles/{cluster_id}",
    response_model=UserProfileResponse,
    response_model_exclude_none=True,
)
async def get_user_profile(cluster_id: int):
    user = await dao.find_user_by_cluster_id(cluster_id)
    if user is None:
        raise HTTPException(404, detail="User not found")
    else:
        return user


if __name__ == "__main__":
    uvicorn.run(app="rest_api:app", reload=True)
