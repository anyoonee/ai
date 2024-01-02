#파일 삭제하기
import os

if os.path.exists("new_file.txt") :
    os. remove("new_file.txt")
else :
    print("존재하지 않는 파일입니다.")
# 폴더 삭제하기
# 폴더 만들기
if os.path.exists("./basic3/mm"):
    print("이미 폴더가 있습니다.")
else :
    os.mkdir("./basic3/mm")

