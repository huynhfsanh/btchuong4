*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}        Admin
${PASSWORD}        admin123
${INVALID_USER}    saiuser
${INVALID_PASS}    saipass

*** Test Cases ***
Đăng Nhập Hợp Lệ
    [Documentation]    Kiểm tra đăng nhập đúng
    Khởi Động Trình Duyệt
    Đi Đến Trang Đăng Nhập
    Điền Thông Tin Đăng Nhập    ${USERNAME}    ${PASSWORD}
    Nhấn Nút Đăng Nhập
    Xác Nhận Đăng Nhập Thành Công
    Kết Thúc Phiên Làm Việc

Đăng Nhập Sai
    [Documentation]    Kiểm tra đăng nhập sai
    Khởi Động Trình Duyệt
    Đi Đến Trang Đăng Nhập
    Điền Thông Tin Đăng Nhập    ${INVALID_USER}    ${INVALID_PASS}
    Nhấn Nút Đăng Nhập
    Xác Nhận Đăng Nhập Thất Bại
    Kết Thúc Phiên Làm Việc

*** Keywords ***
Khởi Động Trình Duyệt
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    1s

Đi Đến Trang Đăng Nhập
    Go To    ${URL}

Điền Thông Tin Đăng Nhập
    [Arguments]    ${user}    ${pass}
    Wait Until Element Is Visible    xpath=//input[@name="username"]    timeout=10s
    Sleep    0.5s
    Input Text    xpath=//input[@name="username"]    ${user}
    Wait Until Element Is Visible    xpath=//input[@name="password"]    timeout=10s
    Sleep    0.5s
    Input Text    xpath=//input[@name="password"]    ${pass}

Nhấn Nút Đăng Nhập
    Wait Until Element Is Visible    xpath=//button[@type="submit"]    timeout=10s
    Sleep    0.5s
    Click Button    xpath=//button[@type="submit"]

Xác Nhận Đăng Nhập Thành Công
    Wait Until Page Contains Element    xpath=//h6[text()="Dashboard"]    timeout=10s

Xác Nhận Đăng Nhập Thất Bại
    Wait Until Page Contains    Invalid credentials    timeout=10s

Kết Thúc Phiên Làm Việc
    Close Browser
