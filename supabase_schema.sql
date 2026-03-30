-- 쇼핑 리스트 테이블 생성 SQL
CREATE TABLE IF NOT EXISTS public.shopping_items (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    name TEXT NOT NULL,
    checked BOOLEAN DEFAULT false NOT NULL
);

-- RLS(Row Level Security) 설정 (모든 익명 사용자에게 공개 접근 허용 - 단순 테스트용)
ALTER TABLE public.shopping_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public_shopping_items_access" ON public.shopping_items
    FOR ALL
    TO anon
    USING (true)
    WITH CHECK (true);
