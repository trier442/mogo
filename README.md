# 모두의 모의고사 v16 - PDF 직접 링크 추출형

## 목적
카테고리 페이지를 순회하여 모의고사 게시글을 찾고, 게시글 안의 PDF 주소를 추출해 `data/exams.json`에 저장합니다. 사이트에서는 국어·수학·영어·한국사·탐구 버튼을 누르면 PDF가 바로 열립니다.

## 사용 순서
1. 압축을 풉니다.
2. `update_from_horaeng.bat`을 더블클릭합니다.
3. 추출이 끝나면 `index_standalone.html`을 더블클릭합니다.

## 명령어로 실행
```bat
pip install requests beautifulsoup4 lxml
python scripts/extract_horaeng_links.py
```

## 생성되는 파일
- `data/exams.json`: 사이트용 자료 DB
- `data/pdf_links.csv`: 엑셀 점검용 PDF 링크 목록
- `data/horaeng_posts.json`: 발견된 게시글 목록
- `data/crawl_failures.json`: 추출 실패 목록
- `index_standalone.html`: 더블클릭 실행용 완성 HTML

## 중요
`index.html`은 `data/exams.json`을 불러오는 서버형입니다. 더블클릭만으로 확인하려면 추출 후 생성되는 `index_standalone.html`을 사용하세요.
