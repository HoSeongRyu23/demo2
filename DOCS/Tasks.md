# 프로젝트 작업 목록 (Task List): SAP FCM Training Sandbox

이 문서는 "SAP FCM 트레이닝 샌드박스" 프로젝트 구현을 위한 상세 작업 내역입니다.

## Phase 1: 개발 환경 구성 및 초기 설정
- [ ] **Repository & Stack Setup**
    - [ ] Git Repository 초기화 및 `.gitignore` 설정
    - [ ] Frontend: Next.js (React) 프로젝트 생성 및 기본 레이아웃 구성 (SAP Fiori 스타일)
    - [ ] Backend: Node.js (Express/NestJS) 또는 Python 프로젝트 초기화
    - [ ] Database: PostgreSQL 인스턴스 설치 및 연결 설정

## Phase 2: 데이터베이스 모델링 (Simplified Schema)
- [ ] **Table 생성 (DDL 작성)**
    - [ ] `T001` (Company Code), `CSKS` (Cost Center) - 마스터 데이터
    - [ ] `BKPF` (전표 헤더), `BSEG` (전표 상세) - 트랜잭션 데이터
    - [ ] `CE1xxxx` (CO-PA/손익 분석) 테이블 설계
- [ ] **Seed Data 구축**
    - [ ] 기본 G/L 계정 (매출, 부가세, 외상매출금 등) 초기 데이터 입력
    - [ ] 예제 코스트 센터 및 자재 마스터 데이터 주입

## Phase 3: 핵심 백엔드 로직 구현
- [ ] **API 개발: 전표 처리 (FI Core)**
    - [ ] POST `/api/posting`: 전표 생성 API 구현
    - [ ] Validation: 차대변 합계 일치 여부 검증 (Balance Check)
    - [ ] Validation: 유효한 G/L 계정 및 코스트 센터 체크
- [ ] **오류 시뮬레이터 로직**
    - [ ] 에러 상황별(계정 오류, 마감 기간 등) Custom Error Message 응답 로직 구현
    - [ ] 오류 원인 및 해결 가이드 텍스트 매핑

## Phase 4: 프론트엔드 UI/UX 개발
- [ ] **공통 UI 컴포넌트 개발**
    - [ ] SAP Fiori 스타일의 Header, Sidebar, Input Field, Table 컴포넌트
- [ ] **전표 입력 화면 (Posting Interface)**
    - [ ] Header 정보 입력 (전기일, 회사코드 등)
    - [ ] Line Items 입력 (동적 행 추가/삭제, 계정 검색 팝업)
- [ ] **프로세스 시각화 (Flowchart)**
    - [ ] React Flow 등을 활용하여 현재 전표의 흐름 시각화 (예: `SO -> Billing -> FI Doc`)

## Phase 5: 시나리오 기능 구현
- [ ] **Scenario A: SD-FI 통합**
    - [ ] 미션 가이드 UI ("비비고 만두 1,000박스 매출 전표를 생성하세요")
    - [ ] 시나리오 성공 조건 체크 로직 구현
- [ ] **Scenario B: 기말 결산 (Allocation)**
    - [ ] 배부 사이클 실행 버튼 및 백엔드 배부 로직(Allocation Engine) 구현
    - [ ] 배부 전후 코스트 센터 잔액 비교 뷰

## Phase 6: 분석 및 리포팅 (CO-PA)
- [ ] **수익성 분석 대시보드**
    - [ ] `CE1xxxx` 테이블 기반의 실시간 손익 리포트 API 개발
    - [ ] 제품별, 고객별 수익성 차트 구현

## Phase 7: 통합 테스트 및 배포
- [ ] **End-to-End Test**
    - [ ] 전체 시나리오(시작~완료) 테스트 및 버그 수정
- [ ] **최종 배포**
    - [ ] Vercel (Front) / Railway or AWS (Back) 배포 설정
