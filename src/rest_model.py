from typing import Optional

from pydantic import BaseModel


class RegisterAccountRequest(BaseModel):
    username: str
    display_name: Optional[str]


class UserProfileResponse(BaseModel):
    username: str
    user_id: int
    display_name: str
    debug: Optional[dict]


class CreatePinRequest(BaseModel):
    user_id: int
    details: str
    link: str


class CreatePinResponse(BaseModel):
    pin_id: int


class UpdatePinRequest(BaseModel):
    details: str
