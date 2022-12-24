from typing import Optional

from pydantic import BaseModel


class RegisterAccountRequest(BaseModel):
    username: str
    display_name: Optional[str]


class RegisterAccountResponse(BaseModel):
    username: str
    user_id: str
    display_name: str
