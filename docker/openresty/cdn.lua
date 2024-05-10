local ffi = require("ffi")

-- 使用C語言 access 檢查檔案是否存在
ffi.cdef [[
int access(const char *pathname, int mode);
]]

local F_OK = 0

-- 檢查文件是否存在的函數
local function file_exists(path)
    if not path then return false end

    local res = ffi.C.access(path, F_OK)
    if res == 0 then
        return true
    else
        return false
    end
end

-- 讀取文件內容的函數
local function read_file(path)
    local file = io.open(path, "r")
    if not file then return nil end
    local content = file:read("*a")
    file:close()
    return content
end

-- 設定回響內容的函數
local function set_response(content)
    ngx.header.content_type = "text/html"
    ngx.say(content)
    ngx.exit(ngx.HTTP_OK)
end

-- 替換 HTML 內容中的資源路徑為 CDN URL
local function replace_resource_paths(content, cdn_url)
    if cdn_url then
        -- 替換 JavaScript 資源路徑
        content = content:gsub('<script%s+src="(.-)"%s*%>',
                               '<script src="' .. cdn_url .. '%1">')
        -- 替換 CSS 資源路徑
        content = content:gsub('<link%s+rel="stylesheet"%s+href="(.-)"%s*/>',
                               '<link rel="stylesheet" href="' .. cdn_url ..
                                   '%1"/>')
    end
    return content
end

-- 封裝的 try_file 函數
local function handle(uri)
    local cdn = ngx.req.get_headers()["x-cdn"]

    if uri == "/" then
        local content = read_file("/usr/share/nginx/www/index.html")
        content = replace_resource_paths(content, cdn)
        set_response(content)
    else
        local files = {uri, uri .. "/", "/index.html"}
        for _, file in ipairs(files) do
            local path = "/usr/share/nginx/www" .. file
            if file_exists(path) then
                local content = read_file(path)
                if content then
                    content = replace_resource_paths(content, cdn)
                    set_response(content)
                else
                    ngx.exit(ngx.HTTP_NOT_FOUND)
                end
                return
            end
        end

        ngx.exit(ngx.HTTP_NOT_FOUND)
    end
end

handle(ngx.var.uri)
