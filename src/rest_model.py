from typing import Optional

from pydantic import BaseModel


class RegisterAccountRequest(BaseModel):
    username: str
    display_name: Optional[str]


class UserProfileResponse(BaseModel):
    username: str
    user_id: int
    display_name: str
    mod_shard: Optional[int]


class CreatePinRequest(BaseModel):
    user_id: int
    details: str
    link: str


class CreatePinResponse(BaseModel):
    pin_id: int
