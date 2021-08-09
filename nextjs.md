CONTENT:

- NEXTJS
- SPA, SSG, SSR
- Get data from BE: axios (call api), SWR (fetch data + caching), REDUX (global state)
- Typescript
- VSCODE extensions
- Folder Structure

1. NEXTJS (Reactjs nói chung)

- Component hoá: Component cha (call api/lấy dữ liệu) và component con (hiển thị dữ liệu mà cha truyền cho)
  -> 1 component chứa state, jsx, side-effect
- Render component: mỗi khi mà có thay đổi gì ở component thì component sẽ được re-render
- State VS Props
  - Component Product: state -> products[]: lấy dữ liệu từ API và gán vào cho state
    Ví dụ: Màn chi tiết sản phẩm (1 component có nhiều state => có bao nhiêu state phụ thuộc vào mục đích sử dụng)
  - Props: dùng để truyền từ cha xuống con: <Cha><Con props={state} /></Cha>, tên props là bất kì, nhiệm vụ của Component con sẽ là lấy giá trị từ props mà cha truyền xuống
- JSX: thẻ HTML nhúng vào code react, tương tự như thẻ HTML (có thêm 1 vài props đặc biệt của React)
- Library: làm thực tế sẽ biết đến
- React Hook: hướng tới functional programming
  - useState: khởi tạo state cho component
    Ví dụ: const [state, setState] = useState(initData);
  - useEffect: call api
    // trc khi call api. state -> null, initData
    //call api -> data
    // setState(data)
    // state -> có dữ liệu
    Ví dụ: useEffect(callbackfuntion, dependency)
    -> useEffect(callProductApi)
    -> useEffect(callProductApi, [])
    -> useEffect(callProductApi, [product]) (callProductApi {setState(product)} ): thay đổi dữ liệu product được thực hiện ở chỗ khác
  - useMemo, useContext (đọc docs)

2. SPA, SSG, SSR

- VÍ dụ: controller <-> blade, lấy dữ liệu ở server rồi render HTML -> trả về cho blade (HTML có data)
- SPA: server render HTML -> client, lấy dữ liệu ở phía client (đầu tiên client sẽ nhận được HTML ko có data, cách hoạt động sẽ tương tự là ajax)
- SSR: server lấy dữ liệu (json) và render HTML (jsx) -> client (đầu tiên client sẽ nhận được luôn 1 trang HTML có data), sẽ thực hiện mỗi khi có request từ client -> phù hợp với các trang có dữ liệu update liên tục
  Ví dự: request /products -> server lấy dữ liệu và render HTML
  sau dó, thao tác CRUD -> client call api (ajax)
- SSG: giống SSR, quét toàn bộ các trang (lấy dữ liệu và render HTML): thời điểm build (yarn build/npm run build), sinh ra toàn bộ static HTML -> phù hợp với các trang có dữ liệu ít thay đổi (blogs)

3. Get data from BE (SSR của Nextjs)

- Axios: get, post, put, patch, delete (đọc docs)
- Thực hiện ở [getServerSideProps] của Nextjs
- SWR: có thêm cơ chế caching
- REDUX: global state
  Ví dụ:
  - Thông thường: Component cha -> component con -> component con -> component con -> component con, con sau cùng muốn có dữ liệu phải truyền theo dạng thác
  - component con sau cùng lấy luôn được dữ liệu từ global state (redux)

4. Typescript

- JS (kiểu dữ liệu động): const value = 0 -> value = "string"
- Typescript:
  const value: number = 1 -> value = "string": báo lỗi
- Union: const value: number | string = 0 -> value = "string" -> value = {}: báo lỗi
- Type alias: function something({id, text}: {id: number, text: string}): string => return ""
  type Something = {id: number, text: string}
  => function something({id, text}: Something): string => return ""
- Type alias + Union: type A = string | number
  => const value: A = 0
- Interface
  => xem docs

5. VSCODE extension

- ESLINT
- Prittier
- ES7 React/Redux/...
- Import Cost
- Frontend library vscode (optional)

6. Folder Structure
   /admin:
   pages
   |---- admin/index: Component Admin
   /admin/supllier:
   pages
   |---- admin/supplier/index: Component Supplier
   /admin/user:
   pages
   |---- admin/user/index: Component User
   /admin/user/{id} (/admin/user/1, /admin/user/2)
   pages
   |---- admin/user/[id]: Component User -> lấy cái id từ url -> sử dụng id để call api
